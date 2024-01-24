#include <iostream>
//Basic namepace std for ease of use
using namespace std;
class ArrayExample {
  public:
  //Create the array
    int searchArray[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
};

int main() {
    //Define the object
    ArrayExample obj;
    //Get the size of the array
    int size = sizeof(obj.searchArray) / sizeof(obj.searchArray[0]);
    //Define the int you're looking for
    int target = 7;
    //Predefined variables
    int left = 0;
    int right = size-1;
    int loc = -1;
    
    //Check and eliminate half of the list until it is narrowed down to the specified value
    while (left <= right) {
        int mid = left + (right - left) / 2;
    
        if (obj.searchArray[mid] == target)
           loc = mid;
        if (obj.searchArray[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    //Output the location
    if(loc!=-1){
        cout<<"Location of "<<target<<" is "<<loc;
    }else{
        cout<< "Target not found";
    }
    return 0;
}