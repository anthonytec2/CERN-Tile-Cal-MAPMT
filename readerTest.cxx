


void readerTest(int fileNum){
ofstream myfile;
std::stringstream ss;
std::stringstream sW;
ss<<"cs"<<fileNum<<".txt";
sW<<"cs"<<fileNum<<".root";
cout<<ss.str()<<endl;
myfile.open(ss.str());
TFile *f = TFile::Open(TString(sW.str()));
f->cd("RawData");
TTreeReader myReader("DAQ.Data.EBA66");
TTreeReaderValue<unsigned short> trigger(myReader, "trigger");
TTreeReaderArray<unsigned short> datas(myReader,"data[48].data");
while(myReader.Next()){
	myfile<<*trigger<<",";
	for(int i=0; i<48;i=i+1){
		myfile<<datas[i]<<",";

	}	
	myfile<<"\n";
}
myfile.close();
}

