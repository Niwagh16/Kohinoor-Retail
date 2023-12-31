pageextension 50357 "Sales credit Memo 1" extends "Sales Credit Memo"
{
    layout
    {
        addafter(Status)
        {
            field("Store No."; Rec."Store No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store No. field.';
            }
        }
    }
    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                SL: Record "Sales Line";
            begin
                SL.Reset();
                SL.SetRange("Document No.", rec."No.");
                IF SL.FindSet() then
                    repeat
                        IF SL.Type <> SL.Type::" " then
                            SL.TestField("Salesperson Code");
                    until SL.Next() = 0;

            end;
        }
        modify(PostAndSend)
        {
            trigger OnBeforeAction()
            var
                SL: Record "Sales Line";
            begin
                SL.Reset();
                SL.SetRange("Document No.", rec."No.");
                IF SL.FindSet() then
                    repeat
                        IF SL.Type <> SL.Type::" " then
                            SL.TestField("Salesperson Code");
                    until SL.Next() = 0;

            end;
        }
    }
}
