function varargout = cellfinder_gui(varargin)
% CELLFINDER_GUI MATLAB code for cellfinder_gui.fig
%      CELLFINDER_GUI, by itself, creates a new CELLFINDER_GUI or raises the existing
%      singleton*.
%
%      H = CELLFINDER_GUI returns the handle to a new CELLFINDER_GUI or the handle to
%      the existing singleton*.
%
%      CELLFINDER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CELLFINDER_GUI.M with the given input arguments.
%
%      CELLFINDER_GUI('Property','Value',...) creates a new CELLFINDER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cellfinder_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cellfinder_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cellfinder_gui

% Last Modified by GUIDE v2.5 13-Jun-2014 17:19:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cellfinder_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @cellfinder_gui_OutputFcn, ...
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


% --- Executes just before cellfinder_gui is made visible.
function cellfinder_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cellfinder_gui (see VARARGIN)

% Choose default command line output for cellfinder_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%filelist loading
if nargin == 3,
    initial_dir = '/home/adityajoshi/git/cellfinder_gui/data';
elseif nargin > 4
    if strcmpi(varargin{1},'dir')
        if exist(varargin{2},'dir')
            initial_dir = varargin{2};
        else
            errordlg('Input argument must be a valid directory', 'Input Argument Error!')
            return
        end
    else
        errordlg('Unrecognized input argument', 'Input Argument Error!')
        return;
    end
end
%Populate the filelist
load_listbox(initial_dir, handles)
% Return figure handle as first output argument

% Choose default command line output for cellfinder_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%filelist loading
if nargin <= 4,
    graph_dir = '/home/adityajoshi/git/cellfinder_gui/save';
elseif nargin > 5
    if strcmpi(varargin{1},'dir')
        if exist(varargin{2},'dir')
            graph_dir = varargin{3};
        else
            errordlg('Input argument must be a valid directory', 'Input Argument Error!')
            return
        end
    else
        errordlg('Unrecognized input argument', 'Input Argument Error!')
        return;
    end
end
%Populate the filelist
load_listbox2(graph_dir, handles)
% Return figure handle as first output argument

% UIWAIT makes cellfinder_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cellfinder_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select_save_dir.
function select_save_dir_Callback(hObject, eventdata, handles)
% hObject    handle to select_save_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_dir = uigetdir('/home/adityajoshi/git/cellfinder_gui');
selected_dir = [selected_dir '/'];
set(handles.save_dir,'String',selected_dir);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in find_cell_button.
function find_cell_button_Callback(hObject, eventdata, handles)
% hObject    handle to find_cell_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_dir = '/home/adityajoshi/git/cellfinder_gui/'; %make this a parameter
path = genpath(load_dir);
addpath(path);
%gen_test(get(handles.select_save_dir,'String'),get(handles.proj_name,'String'),get(handles.filelist));
% NOTE: assumes list has only file type desired
% to change, edit listbox callback function

%have to add error checking
files = get(handles.loaded_fn,'String');
save_dir = get(handles.save_dir,'String');
gen_test(get(handles.save_dir,'String'),get(handles.proj_name,'String'),files);



function proj_name_Callback(hObject, eventdata, handles)
% hObject    handle to proj_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of proj_name as text
%        str2double(get(hObject,'String')) returns contents of proj_name as a double
save_fn = str2num(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function proj_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to proj_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filelist.
function filelist_Callback(hObject, eventdata, handles)
% hObject    handle to filelist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filelist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filelist

get(handles.figure1,'SelectionType');
if strcmp(get(handles.figure1,'SelectionType'),'open')
    index_selected = get(handles.filelist,{'string','Value'});
    if length(index_selected) > 2
        %from testing will delete later
        %{
        a = 'here'
        length(index_selected)
        index_selected
        index_selected{2}
        %}
        return
    else
        %b = 'there'
        index_selected = index_selected{2};
        file_list = get(handles.filelist,'String');
        filename = file_list{index_selected};
        if  handles.is_dir(handles.sorted_index(index_selected))
            cd (filename)
            load_listbox(pwd,handles)
        end
    end
end
list_entries = get(handles.filelist,'String');
index_selected = get(handles.filelist,'Value');
fn = cell(length(index_selected),1);
for i=1:length(index_selected);
    fn{i} = [list_entries{index_selected(i)}];
end
%fn
set(handles.loaded_fn,'String',fn)


% ------------------------------------------------------------
% Read the current directory and sort the names
% ------------------------------------------------------------
function load_listbox(dir_path,handles)
cd (dir_path)
dir_struct = dir(dir_path);
[sorted_names,sorted_index] = sortrows({dir_struct.name}');
handles.file_names = sorted_names;
handles.is_dir = [dir_struct.isdir];
handles.sorted_index = sorted_index;
guidata(handles.figure1,handles)
set(handles.filelist,'String',handles.file_names,...
	'Value',1)


% --- Executes during object creation, after setting all properties.
function filelist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filelist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Add the current directory to the path, as the pwd might change thru' the
% gui. Remove the directory from the path when gui is closed 
% (See figure1_DeleteFcn)
setappdata(hObject, 'StartPath', pwd);
addpath(pwd);

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Remove the directory added to the path in the figure1_CreateFcn.
if isappdata(hObject, 'StartPath')
    rmpath(getappdata(hObject, 'StartPath'));
end


% --- Executes during object creation, after setting all properties.
function loaded_fn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loaded_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function select_save_dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_save_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%DUMMY FUNCTION NEED TO REMOVE 


% --- Executes on selection change in graph_files.
function graph_files_Callback(hObject, eventdata, handles)
% hObject    handle to graph_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph_files contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph_files

get(handles.figure1,'SelectionType');
if strcmp(get(handles.figure1,'SelectionType'),'open')
    index_selected = get(handles.graph_files,{'string','Value'});
    if length(index_selected) > 2
        %from testing will delete later
        %{
        a = 'here'
        length(index_selected)
        index_selected
        index_selected{2}
        %}
        return
    else
        %b = 'there'
        index_selected = index_selected{2};
        file_list = get(handles.graph_files,'String');
        filename = file_list{index_selected};
        if  handles.is_dir(handles.sorted_index(index_selected))
            cd (filename)
            load_listbox2(pwd,handles)
        else
            
            %sprintf(pwd)
            %sprintf(filename)
            load(filename)
            axes(handles.result_plot); % Switches focus to this axes object.
            colormap('gray');
            %t = linspace(0,1,1000);
            %plot(t,sin(t));
            imagesc(img,'Parent',handles.result_plot); % Display it with some command such as imagesc, image, imshow.
            colorbar;
        end
    end
end
%{
list_entries = get(handles.filelist,'String');
index_selected = get(handles.filelist,'Value');
fn = cell(length(index_selected),1);
for i=1:length(index_selected);
    fn{i} = [list_entries{index_selected(i)}];
end
%}
%fn
%set(handles.loaded_fn,'String',fn)

function load_listbox2(dir_path,handles)
cd (dir_path)
dir_struct = dir(dir_path);
[sorted_names,sorted_index] = sortrows({dir_struct.name}');
handles.file_names = sorted_names;
handles.is_dir = [dir_struct.isdir];
handles.sorted_index = sorted_index;
guidata(handles.figure1,handles)
set(handles.graph_files,'String',handles.file_names,...
	'Value',1)


% --- Executes during object creation, after setting all properties.
function graph_files_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
