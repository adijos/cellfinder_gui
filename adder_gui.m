function varargout = adder_gui(varargin)
% ADDER_GUI MATLAB code for adder_gui.fig
%      ADDER_GUI, by itself, creates a new ADDER_GUI or raises the existing
%      singleton*.
%
%      H = ADDER_GUI returns the handle to a new ADDER_GUI or the handle to
%      the existing singleton*.
%
%      ADDER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADDER_GUI.M with the given input arguments.
%
%      ADDER_GUI('Property','Value',...) creates a new ADDER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before adder_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to adder_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help adder_gui

% Last Modified by GUIDE v2.5 06-Jun-2014 16:49:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @adder_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @adder_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before adder_gui is made visible.
function adder_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to adder_gui (see VARARGIN)

% Choose default command line output for adder_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes adder_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = adder_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double

%store the contents of input1_editText as a string. if the string
%is not a number then input will be empty
input = str2num(get(hObject,'String'));

%checks to see if input is empty. if so, default input1_editText to zero
if (isempty(input))
     set(hObject,'String','0')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_button.
function add_button_Callback(hObject, eventdata, handles)
% hObject    handle to add_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(handles.input1,'String');
b = get(handles.input2,'String');
% a and b are variables of Strings type, and need to be converted
% to variables of Number type before they can be added together

total = str2num(a) + str2num(b);
c = num2str(total);
% need to convert the answer back into String type to display it
set(handles.answer,'String',c);
set(handles.operator,'String','+');
guidata(hObject, handles);



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double

%store the contents of input1_editText as a string. if the string
%is not a number then input will be empty
input = str2num(get(hObject,'String'));

%checks to see if input is empty. if so, default input1_editText to zero
if (isempty(input))
     set(hObject,'String','0')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in difference.
function difference_Callback(hObject, eventdata, handles)
% hObject    handle to difference (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(handles.input1,'String');
b = get(handles.input2,'String');
% a and b are variables of Strings type, and need to be converted
% to variables of Number type before they can be added together

total = str2num(a) - str2num(b);
c = num2str(total);
% need to convert the answer back into String type to display it
set(handles.operator,'String','-');
set(handles.answer,'String',c);
guidata(hObject, handles);
