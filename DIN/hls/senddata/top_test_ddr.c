#include<stdio.h>
#include<stdlib.h>
int send(volatile int * data_ptr,
			   volatile float * data,
			   volatile int *req,
			   volatile int *ack,
			   int read_loc);

int main(){
//	int event_num,c;
//	volatile float * PL_read_ptr;
//	float addrdata=10;
////	int addrreq=0;
////	int addrack=0;
//	//1111111111111111111111111111111111111111111111111111111111111111111111111111
//	FILE *fid;
//	fid = fopen("F:\\a.txt","rt");
//	if(fid == NULL)
//	{
//		printf("file error");
//		return 0;
//	}
//	rewind (fid);
//	while((c = fgetc(fid)) != EOF){
//		if(c =='\n')//碰到换行符，则行数+1
//			event_num++;
//	}
//	//1111111111111111111111111111111111111111111111111111111111111111111111111111
//	PL_read_ptr=(volatile float *)malloc(sizeof(float)*event_num);
//	if (PL_read_ptr == NULL){
//		printf("PL_read_ptr error");
//		return 0;
//	}
//	rewind (fid);
//	char str[17];
//
//	int index=0;
//	while(fscanf(fid,"%[^\n]",str)!=EOF){
//		PL_read_ptr[index++]=strtol(str,NULL,2);
//		fgetc(fid);
////		printf("data is %s\n",str);
//	}
//	fclose(fid);
//
//	int result=send(PL_read_ptr,&addrdata,0,0,0);
//	free(PL_read_ptr);     //释放内存

	return 0;
}
