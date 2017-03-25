function varargout = cdocn(varargin)
% CDOCN MATLAB code for cdocn.fig
%      CDOCN, by itself, creates a new CDOCN or raises the existing
%      singleton*.
%
%      H = CDOCN returns the handle to a new CDOCN or the handle to
%      the existing singleton*.
%
%      CDOCN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CDOCN.M with the given input arguments.
%
%      CDOCN('Property','Value',...) creates a new CDOCN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cdocn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cdocn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cdocn

% Last Modified by GUIDE v2.5 24-Mar-2017 11:40:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cdocn_OpeningFcn, ...
                   'gui_OutputFcn',  @cdocn_OutputFcn, ...
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


% --- Executes just before cdocn is made visible.
function cdocn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cdocn (see VARARGIN)

% Choose default command line output for cdocn
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cdocn wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.popupmenu1,'Value',2);%set default value of popupmenu3

% --- Outputs from this function are returned to the command line.
function varargout = cdocn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%------------getting input values------------
sysbw = str2num(get(handles.edit1,'string'));
RFbw = str2num(get(handles.edit2,'string'));
%   get values selected in the popup menus
allItems1 = get(handles.popupmenu1,'string');
allItems2 = get(handles.popupmenu2,'string');
clusterSize = str2num(allItems1{get(handles.popupmenu1,'Value')});
sectorisation = str2num(allItems2{get(handles.popupmenu2,'Value')});

meanCall = str2num(get(handles.edit3,'string'));
callArrival = str2num(get(handles.edit4,'string'));
callBlocking = str2num(get(handles.edit5,'string'));
radiusMin = str2num(get(handles.edit6,'string'));
radiusMax = str2num(get(handles.edit7,'string'));


%------------input check------------
if isempty(sysbw) || isempty(RFbw) || isempty(meanCall) || isempty(callArrival) ...
        || isempty(callBlocking) || isempty(radiusMin) || isempty(radiusMax)
    msgbox('Please fill all parameters with number!','Warning','warn');
    return
end
if sysbw < 0
    msgbox('System bandwidth cannot be negative','Warning','warn');
    return
end
if RFbw < 0
    msgbox('Channel RF bandwidth cannot be negative','Warning','warn');
    return
end
if ceil(sysbw.*1000./RFbw)>1100
    msgbox('Ratio of SYSTEM bandwidth and CHANNEL bandwidth is too large','Warning','warn');
    return
end
if meanCall < 0
    msgbox('Mean call duration cannot be negative','Warning','warn');
    return
end
if callArrival < 0
    msgbox('Call arrival rate cannot be negative','Warning','warn');
    return
end
if callBlocking < 0 || callBlocking >1
    msgbox('Call blocking probability should be within 0~1','Warning','warn');
    return
end
if radiusMin < 0 || radiusMax < 0 || radiusMin >= radiusMax
    msgbox('Please input correct radius range!','Warning','warn');
    return
elseif radiusMax > 10000
    msgbox('Radius range is too large','Warning','warn');
    return
end

if radiusMin < 0 || radiusMax < 0 || radiusMin >= radiusMax
    msgbox('Please input correct radius range!','Warning','warn');
    return
end


%------------calculation------------
%   first cloumn values
cpcluster = ceil(sysbw.*1000./RFbw);
cpcell =  ceil(sysbw.*1000./RFbw./clusterSize);
cpsector = ceil(sysbw.*1000./RFbw./clusterSize./sectorisation);

%   second cloumn values
tpcluster = inverlangb(cpcluster, callBlocking);
tpcell = inverlangb(cpcell,callBlocking); %traffic per cell
tpsector = tpcell./sectorisation; %traffic per sector
tpuser = meanCall.*callArrival./3600; %traffic per user

%   third column values
upcluster = ceil(tpcluster./tpuser);
upcell = ceil(tpcell./tpuser);
upsector = ceil(tpsector./tpuser);


%------------showing results------------
%   show first cloumn values
set(handles.text20,'string',cpcluster);
set(handles.text21,'string',cpcell);
set(handles.text22,'string',cpsector);

%   show second cloumn values
set(handles.text23,'string',tpcluster);
set(handles.text24,'string',tpcell);
set(handles.text25,'string',tpsector);
set(handles.text26,'string',tpuser);

%   show second cloumn values
set(handles.text27,'string',upcluster);
set(handles.text28,'string',upcell);
set(handles.text29,'string',upsector);


%------------drawing figure------------
%   define function expression
x1 = [radiusMin:radiusMax];
x2 = [radiusMin:radiusMax];
y1 = callArrival.*tpcell./(3.*sqrt(3)./2.*(x1/1000).*(x1/1000));
y2 = callArrival.*upcell./(3.*sqrt(3)./2.*(x2/1000).*(x2/1000));

%   drawing
axes(handles.axes1);
plot(x1,y1,'r');
xlim([radiusMin,inf]);
xlabel('Cell radius (metres)');
ylabel('Traffic density (Erlangs/km^{2})');
title('Traffic density');

axes(handles.axes2);
plot(x2,y2,'b');
xlim([radiusMin,inf]);
xlabel('Cell radius (metres)');
ylabel('User density (Users/km^{2})');
title('User density');

msgbox('Calculation finished','Result','help');
