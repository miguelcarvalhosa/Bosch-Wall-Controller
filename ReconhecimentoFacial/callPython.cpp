#define PY_SSIZE_T_CLEAN
#include <python2.7/Python.h>
#include <stdio.h>

// para compilar:
// g++ -I/usr/include/python2.7 callPython.cpp -lpython2.7 -o callPython
// e preciso ter o python 2.7 instaldo


int main(void) {
    	printf("start cpp function\n");
     
    	Py_Initialize();
	PyRun_SimpleString("import sys; sys.path.append('.')");
	printf("1\n");
	PyObject* myModuleString = PyString_FromString((char*)"new_user");
	PyObject* myModule = PyImport_Import(myModuleString);
	PyObject* myFunction = PyObject_GetAttrString(myModule,(char*)"addUser");
	PyObject* args = NULL; //PyTuple_Pack(1,PyFloat_FromDouble(2.0));
	PyObject_CallObject(myFunction, NULL);
	//int result;
	//result = PyFloat_AsDouble(myResult);
	//printf("Resultado: %d\n", result);
    	Py_Finalize();

    return 0;
}
