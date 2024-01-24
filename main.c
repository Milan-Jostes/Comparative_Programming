#include <stdio.h>

int main() {
    //Define the array of values
    int searchArray[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    //Find the number of elements in the array
    int size = sizeof(searchArray) / sizeof(searchArray[0]);
    //Set a target value
    int target = 7;
    //Define bounds
    int left = 0;
    int right = size-1;
    int loc = -1;
    
    //Figure out if the mid point is greater or less than the target value, adjust accordingly
    while (left <= right) {
        int mid = left + (right - left) / 2;
    
        if (searchArray[mid] == target)
           loc = mid;
        if (searchArray[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    //If the target exists output the location, if not output that it wasn't found
    if(loc!=-1){
        printf("Location of %d is %d",target,loc);
    }else{
        printf("Target not found");
    }
    return 0;
}
