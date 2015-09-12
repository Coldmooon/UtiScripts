#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>

using namespace cv;
using namespace std;

static void show_usage(std::string name)
{
    std::cout << "Usage: " << name << " <option(s)> SOURCES" << std::endl
    << "Options:" << std::endl
    << "\t-i,--i   INPUTFILE\tSpecify the input file" << std::endl;
}

int main(int argc, char const *argv[])
{
    string imageList;
    
    if(argc == 1 || argc > 5)
    {
        cout << "There are too many parameters: " << argc << endl;
        show_usage(argv[0]);
        return 1;
    }
    
    // parse part of the command-line parameters.
    for (int i = 1; i < argc; ++i)
    {
        string arg = argv[i];
        if( (arg == "-i") || (arg == "--i") )
        {
            if (i+1 < argc)
            {
                i++;
                imageList = argv[i];
            }
            else
            {
                cout << "-i requires one peremeter." << endl;
                return 1;
            }
        }
        else
        {
            cout << "argv[" << i << "] is:" << argv[i] << endl;
            show_usage(argv[0]);
            return 1;
        }
    }
    
    vector<string> imgPath;//输入文件名变量
    string buf;
    // c_str() is required by C++11.
    ifstream openImage( imageList.c_str() );//首先，这里搞一个文件列表，把训练样本图片的路径都写在这个txt文件中，使用bat批处理文件可以得到这个txt文件
    
    while( openImage )//将训练样本文件依次读取进来
    {
        if( getline( openImage, buf ) )
        {
            
            imgPath.push_back( buf );//图像路径
            
        }
    }
    
    Mat img;
    vector<Point> locations;
    
    for (int i = 0; i < imgPath.size(); ++i)
    {
        cout << "We're processing the image: " << imgPath[i] << endl;
        string fullPath = "/home/coldmoon/ComputerVision/caffe/data/flickr_style/images/" + imgPath[i];
        img = imread(fullPath);
        Mat resizedImg;
        Size sz = Size(256,256);
        
        if (img.rows != 256 || img.cols != 256 )
        {
            cout << "Resizing..." << endl;
            resize(img, resizedImg, sz);
        }
        else
        {
            resizedImg = img;
            cout << "No need to resize for this image." << __LINE__ << endl;
            continue;
        }
        // cout << imgUsedActually.cols << imgUsedActually.rows << endl;
        // imshow("imgUsedActually", imgUsedActually);
        // waitKey(0);
        
        /**
         * because the size of img is 64*128 which is the same as that of HOGDescriptor,
         * hog->compute(img, hogFeatures[i], Size(64,64), Size(0,0), locations) does not depend on the parameter of Size(64,64).
         * Whatever the third parameter of Size(x,x) is equal to , the value of HOG does not change in this case.
         */
        string targetPath = "/home/coldmoon/ComputerVision/caffe/data/flickr_style/resizedimgs/" + imgPath[i];
        cout << "The img size: " << resizedImg.rows << ":" << resizedImg.cols << endl;
        
        imwrite(targetPath, resizedImg);

    }
    
    cout << "done successfullys!" << endl;
    
}
