table 50317 "Trade Aggrement"
{
    Caption = 'Trade Agreement';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(2; "From Date"; Date)
        {
            Caption = 'From Date';
            DataClassification = ToBeClassified;
        }
        field(3; "To Date"; Date)
        {
            Caption = 'To Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(5; "Amount In INR"; Decimal)
        {
            Caption = 'Amount In INR';
            DataClassification = ToBeClassified;
        }
        field(6; "Purchase Price"; Decimal)
        {
            Caption = 'Purchase Price';
            DataClassification = ToBeClassified;
        }
        field(7; "M.R.P"; Decimal)
        {
            Caption = 'M.R.P';
            DataClassification = ToBeClassified;
        }
        field(8; DP; Decimal)
        {
            Caption = 'DP';
            DataClassification = ToBeClassified;
        }
        field(9; MOP; Decimal)
        {
            Caption = 'MOP';
            DataClassification = ToBeClassified;
        }
        field(10; "Manager Discection"; Decimal)
        {
            Caption = 'Manager Discection';
            DataClassification = ToBeClassified;
        }
        field(11; "Last Selling Price"; Decimal)
        {
            Caption = 'Last Selling Price';
            DataClassification = ToBeClassified;
        }
        field(12; NNLC; Decimal)
        {
            Caption = 'NNLC';
            DataClassification = ToBeClassified;
        }
        field(13; FNNLC; Decimal)
        {
            Caption = 'FNNLC';
            DataClassification = ToBeClassified;
        }
        field(14; Sellout; Decimal)
        {
            Caption = 'Sellout';
            DataClassification = ToBeClassified;
        }
        field(15; "Sellout Text"; Text[100])
        {
            Caption = 'Sellout Text';
            DataClassification = ToBeClassified;
        }
        field(16; "Detailed NNLC"; Text[100])
        {
            Caption = 'Detailed NNLC';
            DataClassification = ToBeClassified;
        }
        field(17; "SLAB 1 - PRICE"; Decimal)
        {
            Caption = 'SLAB 1 - PRICE';
            DataClassification = ToBeClassified;
        }
        field(18; "SLAB 1 - X-PRICE"; Decimal)
        {
            Caption = 'SLAB 1 - Exc-PRICE';
            DataClassification = ToBeClassified;
        }
        field(19; "SLAB 2 - PRICE"; Decimal)
        {
            Caption = 'SLAB 2 - PRICE';
            DataClassification = ToBeClassified;
        }
        field(20; "SLAB 2 - X-PRICE"; Decimal)
        {
            Caption = 'SLAB 2 - Exc-PRICE';
            DataClassification = ToBeClassified;
        }
        field(21; "SLAB 2 - INC"; Decimal)
        {
            Caption = 'SLAB 2 - INC';
            DataClassification = ToBeClassified;
        }
        field(22; "Customer Group"; Enum "Trade Customer Group")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Group';
        }
        field(23; UOM; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'UOM';
        }
        field(24; "Amount in Transaction Currency"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount in Transaction Currency';
        }
        field(25; "Fnnlc with sell out"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fnnlc with sell out';
        }
        field(26; "Actual From Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Actual From Date';
        }
        field(27; "Actual To Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Actual To Date';
        }
        field(28; From; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'From';
        }
        field(29; "To"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'To';
        }
        field(30; "SLAB 1 - INC"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'SLAB 1 - INC';
        }
        field(31; "Manager Discection - INC"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Manager Discection - INC';
        }
        field(32; "FOC/Sellout"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'FOC/Sellout';
        }
        field(33; AMZ; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'AMZ';
        }
        field(34; "KTVWEB_WOE"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'KTVWEB_WOE';
        }
        field(35; "KTVWEB_WE"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'KTVWEB_WE';
        }
        field(36; "PRICE_TAG"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PRICE_TAG';
        }
        field(37; "ALLFINANCE"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'ALLFINANCE';
        }
        field(38; CASHBACK; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CASHBACK';
        }
        field(39; PROMO; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PROMO';
        }
        field(40; "FNNLC Without SELLOUT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Item No. 2"; Code[20])
        {
            Caption = 'Item No.';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."No. 2" where("No." = field("Item No.")));
            Editable = false;
        }
        field(42; "PMG NLC W/O SELL OUT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Category 1"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 1" where("No." = field("Item No.")));
        }
        field(44; "Category 2"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 2" where("No." = field("Item No.")));
        }
        field(45; "Category 3"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 3" where("No." = field("Item No.")));
        }
        field(46; "Category 4"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 4" where("No." = field("Item No.")));
        }
        field(47; "Category 5"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 5" where("No." = field("Item No.")));
        }
        field(48; "Category 6"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 6" where("No." = field("Item No.")));
        }
        field(49; "Category 7"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 7" where("No." = field("Item No.")));
        }
        field(50; "Category 8"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Category 8" where("No." = field("Item No.")));
        }
        field(51; "Sell out Text From Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Sell out Text To Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(53; Description; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
            Editable = false;

        }

    }
    keys
    {
        key(PK; "Item No.", "From Date", "To Date", "Location Code", "Customer Group", "Amount In INR")
        {
            Clustered = true;
        }
    }
}
