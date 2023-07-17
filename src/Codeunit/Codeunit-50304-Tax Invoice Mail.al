codeunit 50304 "Tax Invoice Mail"
{
    trigger OnRun()
    var
        PPL: Record "Posted Payment Lines";
        PaymentMethod: Record "Payment Method";
        SalesInvHdr: Record "Sales Invoice Header";
    begin
        PPL.Reset();
        PPL.SetCurrentKey("Invoice Posting Date");
        //PPL.SetRange("Invoice Posting Date", CalcDate('-1D', Today));
        PPL.SetRange("Document No.", 'THATI23240900023');
        IF PPL.FindSet() then
            repeat
                IF PaymentMethod.Get(PPL."Payment Method Code") then begin
                    IF PaymentMethod."Payment Type" = PaymentMethod."Payment Type"::Finance then begin
                        SalesInvHdr.Reset();
                        SalesInvHdr.SetRange("No.", PPL."Document No.");
                        IF SalesInvHdr.FindFirst() then
                            SendMail(SalesInvHdr, PaymentMethod);
                    end;
                end;
            until PPL.Next() = 0;
    end;

    local procedure SendMail(SIH: Record "Sales Invoice Header"; PayMethod: Record "Payment Method")
    var
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        Instr: InStream;
        EMail: Codeunit Email;
        Emailmessage: Codeunit "Email Message";
        VarRecipient: list of [Text];
        Char: Char;
        ETF: Record "Email to Finance";
        SIHNEW: Record 112;
    begin
        VarRecipient.RemoveRange(1, VarRecipient.Count);

        ETF.Reset();
        ETF.SetCurrentKey("Payment Method");
        ETF.SetRange("Payment Method", PayMethod.Code);
        IF ETF.FindSet() then
            repeat
                VarRecipient.Add(ETF."E-Mail");
            until ETF.Next() = 0;
        //**** Email Create ****            
        Emailmessage.Create(VarRecipient, 'Tax Invoice' + SIH."No." + ' Dated ' + FORMAT(SIH."Order Date"), '', true);
        //**** Report SaveAsPDF and Attached in Mail
        SIHNEW.Reset();
        SIHNEW.SetRange("No.", SIH."No.");
        IF SIHNEW.FindFirst() then;

        Recref.GetTable(SIHNEW);
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Tax Invoice", '', ReportFormat::Pdf, OutStr, Recref);
        TempBlob.CreateInStream(InStr);
        Emailmessage.AddAttachment('Tax Sales Invoice.pdf', '.pdf', InStr);

        //**** Email Body Creation *****
        Emailmessage.AppendToBody('<p><font face="Georgia">Dear <B>Sir,</B></font></p>');
        Char := 13;
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody('<p><font face="Georgia"> <B>!!!Greetings!!!</B></font></p>');
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody('<p><font face="Georgia"><BR>Please find enclosed Tax Invoice.</BR></font></p>');
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody('<p><font face="Georgia"><BR>Thanking you,</BR></font></p>');
        Emailmessage.AppendToBody('<p><font face="Georgia"><BR>Warm Regards,</BR></font></p>');
        Emailmessage.AppendToBody('<p><font face="Georgia"><BR><B>For Kohinoor</B></BR></font></p>');
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody(FORMAT(Char));
        //Emailmessage.AppendToBody('<p><font face="Georgia"><BR><B>(Logistic Team)</B></BR></font></p>');
        Emailmessage.AppendToBody(FORMAT(Char));
        Emailmessage.AppendToBody(FORMAT(Char));
        //**** Email Send Function

        EMail.Send(Emailmessage, Enum::"Email Scenario"::Default);

    end;
}
