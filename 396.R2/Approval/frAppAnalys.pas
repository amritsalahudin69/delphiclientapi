unit frAppAnalys;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scControls, scGPControls, Vcl.ExtCtrls;

type
  TfAppAnalys = class(TForm)
    scGPPanel2: TscGPPanel;
    scGPPanel1: TscGPPanel;
    GridPanel1: TGridPanel;
    eCIF: TscLabel;
    eNama: TscLabel;
    ePinjaman: TscLabel;
    ePerihal: TscLabel;
    eStatus: TscLabel;
    eBtrima: TscButton;
    scLabel1: TscLabel;
    eTglMohon: TscLabel;
    elCif: TscLabel;
    elNama: TscLabel;
    elNomor: TscLabel;
    elPerihal: TscLabel;
    elTglMohon: TscLabel;
    elStatus: TscLabel;
    procedure eBtrimaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAppAnalys: TfAppAnalys;

implementation

{$R *.dfm}

procedure TfAppAnalys.eBtrimaClick(Sender: TObject);
begin
//buat update untuk pra anggota dengan method put brisi update :
// crt_user : ambil dri Session
// Approved by : ambil dri session
//approved time : date Now();

// buat insert untuk tcat_anggota_approval dengn method post :
//approval_id = generate/autoincrament
//trans_date = date
//goid = goid
//approvedby = petugas (session)
//opproved_time = tgl approved
//id_legal = id_legal(session)
//type_anggota = type anggota
//idwil = idwil pemohon
//oauthd_id = grup_id(session)
end;

end.
