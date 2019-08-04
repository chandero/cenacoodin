{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1995-2001 Borland Software Corporation }
{                                                       }
{       Traducido al español por:                       }
{       Jose J. Camacho Pachon                          }
{       jjcapa@jazzfree.com                             }
{                         Agosto, 2001                  }
{                                                       }
{                                                       }
{  Basado en las traducciones de:                       }
{                                                       }
{     David Vinyals <dvinyals@codifont.com>             }
{     Favio Ugalde <fugalde@geocities.com>              }
{                                                       }
{*******************************************************}

unit Consts;

//{$MODE Delphi}

interface       
resourcestring
  SOpenFileTitlem = 'Abrir'; // 'Open';
  SCantWriteResourceStreamError = 'No se puede escribir en un flujo de solo lectura'; // 'Can''t write to a read-only resource stream';
  SDuplicateReference = 'WriteObject llamado dos veces por la misma instancia'; // 'WriteObject called twice for the same instance';
  SClassMismatch = 'El recurso %s es una clase incorrecta'; // 'Resource %s is of incorrect class';
  SInvalidTabIndex = 'Indice de pagina fuera de rango'; // 'Tab index out of bounds';
  SInvalidTabPosition = 'Posicion de pagina incompatible con el actual estilo de pagina'; //'Tab position incompatible with current tab style';
  SInvalidTabStyle = 'Estilo de pagina incompatible con la actual posicion de pagina'; // 'Tab style incompatible with current tab position';
  SInvalidBitmap = 'Imagen Bitmap no valida'; // 'Bitmap image is not valid';
  SInvalidIcon = 'Imagen Icon no valida'; // 'Icon image is not valid';
  SInvalidMetafile = 'Metaarchivo no valido'; // 'Metafile is not valid';
  SInvalidPixelFormat = 'Formato de pixel no valido'; // 'Invalid pixel format';
  SInvalidImage = 'Imagen invalida'; // 'Invalid image';
  SBitmapEmpty = 'El Bitmap esta vacio'; // 'Bitmap is empty';
  SScanLine = 'Indice de la linea examinada fuera de rango'; // 'Scan line index out of range';
  SChangeIconSize = 'No se puede cambiar el tamaño de un icono'; // 'Cannot change the size of an icon';
  SOleGraphic = 'Operacion sobre TOleGraphic no valida'; // 'Invalid operation on TOleGraphic';
  SUnknownExtension = 'Extension de archivo de imagen (.%s) desconocida'; // 'Unknown picture file extension (.%s)';
  SUnknownClipboardFormat = 'Formato del portapapeles no soportado'; // 'Unsupported clipboard format';
  SOutOfResources = 'Sin recursos del sistema'; // 'Out of system resources';
  SNoCanvasHandle = 'El Canvas no permite dibujar'; // 'Canvas does not allow drawing';
  SInvalidImageSize = 'Tamaño de imagen no valido'; // 'Invalid image size';
  STooManyImages = 'Demasiadas imagenes'; // 'Too many images';
  SDimsDoNotMatch = 'El tamaño de la imagen no concuerda con el tamaño de la lista de imagenes'; // 'Image dimensions do not match image list dimensions';
  SInvalidImageList = 'ImageList no valida'; // 'Invalid ImageList';
  SReplaceImage = 'Incapaz de reemplazar imagen'; // 'Unable to Replace Image';
  SImageIndexError = 'Indice de ImageList no valido'; // 'Invalid ImageList Index';
  SImageReadFail = 'Error al leer datos de ImageList desde el flujo'; // 'Failed to read ImageList data from stream';
  SImageWriteFail = 'Error al escribir en el flujo los datos de Imagelist'; // 'Failed to write ImageList data to stream';
  SWindowDCError = 'Error al crear el dispositivo de contexto de la ventana'; // 'Error creating window device context';
  SClientNotSet = 'Cliente de TDrag no inicializado'; // 'Client of TDrag not initialized';
  SWindowClass = 'Error al crear la clase de ventana'; // 'Error creating window class';
  SWindowCreate = 'Error al crear la ventana'; // 'Error creating window';
  SCannotFocus = 'Una ventana invisible o desactivada no puede recibir el foco'; // 'Cannot focus a disabled or invisible window';
  SParentRequired = 'El control ''%s'' no tiene ventana ancestro'; // 'Control ''%s'' has no parent window';
  SParentGivenNotAParent = 'El ancestro aportado no lo es de ''%s'''; // 'Parent given is not a parent of ''%s''';
  SMDIChildNotVisible = 'No se puede ocultar un formulario MDI Child'; // 'Cannot hide an MDI Child Form';
  SVisibleChanged = 'No se puede cambiar la propiedad Visible en "OnShow" o "OnHide"'; // 'Cannot change Visible in OnShow or OnHide';
  SCannotShowModal = 'No se puede hacer visible una ventana modal'; // 'Cannot make a visible window modal';
  SScrollBarRange = 'Propiedad Scrollbar fuera de rango'; // 'Scrollbar property out of range';
  SPropertyOutOfRange = 'Propiedad %s fuera de rango'; // '%s property out of range';
  SMenuIndexError = 'Indice de menu fuera de rango'; // 'Menu index out of range';
  SMenuReinserted = 'Menu insertado dos veces'; // 'Menu inserted twice';
  SMenuNotFound = 'El sub-menu no se encuentra en un menu'; // 'Sub-menu is not in menu';
  SNoTimers = 'No hay suficientes timers disponibles'; // 'Not enough timers available';
  SNotPrinting = 'La impresora no se encuentra actualmente imprimiendo'; // 'Printer is not currently printing';
  SPrinting = 'Impresion en progreso'; // 'Printing in progress';
  SPrinterIndexError = 'Indice de impresora fuera de rango'; // 'Printer index out of range';
  SInvalidPrinter = 'La impresora seleccionada no es valida'; // 'Printer selected is not valid';
  SDeviceOnPort = '%s en %s'; // '%s on %s';
  SGroupIndexTooLow = 'GroupIndex no puede ser menor que el GroupIndex de un elemento previo del menu'; // 'GroupIndex cannot be less than a previous menu item''s GroupIndex';
  STwoMDIForms = 'No puede haber mas de un formulario MDI por aplicacion'; // 'Cannot have more than one MDI form per application';
  SNoMDIForm = 'No se puede crear el formulario. Actualmente no hay formularios MDI activos'; // 'Cannot create form. No MDI forms are currently active';
  SImageCanvasNeedsBitmap = 'Solo se puede modificar una imagen si contiene un bitmap'; // 'Can only modify an image if it contains a bitmap';
  SControlParentSetToSelf = 'Un control no puede referirse al el mismo como ancestro'; // 'A control cannot have itself as its parent';
  SOKButton = 'Aceptar'; // 'OK';
  SCancelButton = 'Cancelar';// 'Cancel';
  SYesButton = '&Si'; // '&Yes';
  SNoButton = '&No';
  SHelpButton = 'Ay&uda'; // '&Help';
  SCloseButton = '&Cerrar'; // '&Close';
  SIgnoreButton = '&Ignorar'; // '&Ignore';
  SRetryButton = '&Reintentar'; // '&Retry';
  SAbortButton = 'Abortar'; // 'Abort';
  SAllButton = '&Todo'; // '&All';

  SCannotDragForm = 'No se puede arrastrar un formulario'; // 'Cannot drag a form';
  SPutObjectError = 'Elemento no definido para PutObject'; // 'PutObject to undefined item';
  SCardDLLNotLoaded = 'No se pudo cargar CARDS.DLL'; // 'Could not load CARDS.DLL';
  SDuplicateCardId = 'CardId duplicado encontrado'; // 'Duplicate CardId found';

  SDdeErr = 'DDE devolvio un error ($0%x)'; // 'An error returned from DDE  ($0%x)';
  SDdeConvErr = 'Error DDE - conversacion no establecida ($0%x)'; // 'DDE Error - conversation not established ($0%x)';
  SDdeMemErr = 'Ocurrio un error cuando DDE se ejecuto fuera de memoria ($0%x)'; // 'Error occurred when DDE ran out of memory ($0%x)';
  SDdeNoConnect = 'Incapaz de conectar con conversacion DDE'; // 'Unable to connect DDE conversation';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';      
  SOldTShape = 'No se puede cargar una version anterior de TShape'; // 'Cannot load older version of TShape';
  SVMetafiles = 'Metaarchivos'; // 'Metafiles';
  SVEnhMetafiles = 'Metaarchivos realzados'; // 'Enhanced Metafiles';
  SVIcons = 'Iconos'; // 'Icons';
  SVBitmaps = 'Mapas de bit'; // 'Bitmaps';
  SGridTooLarge = 'Rejilla demasiado grande para la operacion'; // 'Grid too large for operation';
  STooManyDeleted = 'Demasiadas filas o columnas eliminadas'; // 'Too many rows or columns deleted';
  SIndexOutOfRange = 'Indice de la rejilla fuera de rango'; // 'Grid index out of range';
  SFixedColTooBig = 'El numero de columnas fijas debe ser menor que el numero total de columnas'; // 'Fixed column count must be less than column count';
  SFixedRowTooBig = 'El numero de filas fijas debe ser menor que el numero total de filas'; // 'Fixed row count must be less than row count';
  SInvalidStringGridOp = 'No se puede insertar o eliminar filas de la rejilla'; // 'Cannot insert or delete rows from grid';
  SInvalidEnumValue = 'Valor de Enum no valido'; // 'Invalid Enum Value';
  SInvalidNumber = 'Valor numerico no valido'; // 'Invalid numeric value';
  SOutlineIndexError = 'Indice de Outline no encontrado'; // 'Outline index not found';
  SOutlineExpandError = 'El ancestro debe estar expandido'; // 'Parent must be expanded';
  SInvalidCurrentItem = 'Valor no valido para el elemento actual'; // 'Invalid value for current item';
  SMaskErr = 'Valor de entrada no valido'; // 'Invalid input value';
  SMaskEditErr = 'Valor de entrada no valido. Use la tecla ESC para abandonar los cambios'; // 'Invalid input value.  Use escape key to abandon changes';
  SOutlineError = 'Indice Outline no valido'; // 'Invalid outline index';
  SOutlineBadLevel = 'Nivel de asignacion incorrecto'; // 'Incorrect level assignment';
  SOutlineSelection = 'Seleccion no valida'; // 'Invalid selection';
  SOutlineFileLoad = 'Error en la carga del archivo'; // 'File load error';
  SOutlineLongLine = 'Linea demasiado larga'; // 'Line too long';
  SOutlineMaxLevels = 'Profundidad maxima de Outline excedida'; // 'Maximum outline depth exceeded';

  SMsgDlgWarning = 'Aviso'; // 'Warning';
  SMsgDlgError = 'Error';
  SMsgDlgInformation = 'Informacion'; // 'Information';
  SMsgDlgConfirm = 'Confirmacion'; // 'Confirm';
  SMsgDlgYes = '&Si'; // '&Yes';
  SMsgDlgNo = '&No';
  SMsgDlgOK = 'Aceptar'; // 'OK';
  SMsgDlgCancel = 'Cancelar'; // 'Cancel';
  SMsgDlgHelp = 'Ay&uda'; // '&Help';
  SMsgDlgHelpNone = 'No hay ayuda disponible'; // 'No help available';
  SMsgDlgHelpHelp = 'Ayuda'; // 'Help';
  SMsgDlgAbort = '&Abortar'; // '&Abort';
  SMsgDlgRetry = '&Reintentar'; // '&Retry';
  SMsgDlgIgnore = '&Ignorar'; // '&Ignore';
  SMsgDlgAll = '&Todo'; // '&All';
  SMsgDlgNoToAll = 'N&o a todo'; // 'N&o to All';
  SMsgDlgYesToAll = 'Si a &todo'; // 'Yes to &All';

  SmkcBkSp = 'Retr'; // BkSp
  SmkcTab = 'Tab'; // Tab
  SmkcEsc = 'Esc'; // Esc
  SmkcEnter = 'Intro'; // Enter
  SmkcSpace = 'Espacio'; // Space
  SmkcPgUp = 'Re Pag'; // PgUp
  SmkcPgDn = 'Av Pag'; // PgDn
  SmkcEnd = 'Fin'; // End
  SmkcHome = 'Inicio'; // Home
  SmkcLeft = 'Izq'; // Left
  SmkcUp = 'Arriba'; // Up
  SmkcRight = 'Der'; // Right
  SmkcDown = 'Abajo'; // Down
  SmkcIns = 'Ins'; // Ins
  SmkcDel = 'Supr'; // Del
  SmkcShift = 'Mayus+'; // Shift+
  SmkcCtrl = 'Ctrl+'; // Ctrl+
  SmkcAlt = 'Alt+'; // Alt+

  srUnknown = '(Desconocido)'; // '(Unknown)';
  srNone = '(Ninguno)'; // '(None)';
  SOutOfRange = 'El valor debe hallarse entre %d y %d'; // 'Value must be between %d and %d';

  SDateEncodeError = 'Argumento no valido para codificar fecha'; // 'Invalid argument to date encode';
  SDefaultFilter = 'Todos los archivos (*.*)|*.*'; // 'All files (*.*)|*.*';
  sAllFilter = 'Todos'; // 'All';
  SNoVolumeLabel = ': [ - sin etiqueta - ]'; // ': [ - no volume label - ]';
  SInsertLineError = 'Incapaz de insertar una linea'; // 'Unable to insert a line';

  SConfirmCreateDir = 'La carpeta especificada no existe. Crearla ?'; // 'The specified directory does not exist. Create it?';
  SSelectDirCap = 'Seleccione una carpeta'; // 'Select Directory';
  SDirNameCap = '&Nombre de carpeta'; // 'Directory &Name:';
  SDrivesCap = '&Discos'; // 'D&rives:';
  SDirsCap = '&Carpetas'; // '&Directories:';
  SFilesCap = '&Archivos'; // '&Files: (*.*)';
  SNetworkCap = '&Red...'; // 'Ne&twork...';

  SColorPrefix = 'Color';               //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP';      //!! obsolete - delete in 5.0

  SInvalidClipFmt = 'Formato del portapapeles no valido'; // 'Invalid clipboard format';
  SIconToClipboard = 'El portapapeles no soporta iconos'; // 'Clipboard does not support Icons';
  SCannotOpenClipboard = 'No se puede abrir el portapapeles'; // 'Cannot open clipboard';

  SDefault = 'Por defecto'; // 'Default';

  SInvalidMemoSize = 'El texto excede la capacidad de la memoria'; // 'Text exceeds memo capacity';
  SCustomColors = 'Colores personalizados'; // 'Custom Colors';
  SInvalidPrinterOp = 'Operacion no soportada por la impresora seleccionada'; // 'Operation not supported on selected printer';
  SNoDefaultPrinter = 'Actualmente no hay impresora seleccionada por defecto'; // 'There is no default printer currently selected';

  SIniFileWriteError = 'Incapaz de escribir en %s'; // 'Unable to write to %s';

  SBitsIndexError = 'Indice de bits fuera de rango'; // 'Bits index out of range';

  SUntitled = '(Sin titulo)'; // '(Untitled)';

  SInvalidRegType = 'Tipo de dato no valido para ''%s'''; // 'Invalid data type for ''%s''';

  SUnknownConversion = 'Extension de archivo (.%s) de texto enriquecido desconocida'; // 'Unknown RichEdit conversion file extension (.%s)';
  SDuplicateMenus = 'El menu ''%s'' ya esta siendo usado por otro formulario'; // 'Menu ''%s'' is already being used by another form';

  SPictureLabel = 'Imagen'; // 'Picture:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = 'Previsualizacion'; // 'Preview';

  SCannotOpenAVI = 'No se puede abrir el archivo AVI'; // 'Cannot open AVI';

  SNotOpenErr = 'No hay dispositivos MCI abiertos'; // 'No MCI device open';
  SMPOpenFilter = 'Todos los archivos (*.*)|*.*|Archivos Wave|(*.wav)|*.wav|Archivos Mido (*.mid)|*.mid|Videos para Windows (*.avi)|*.avi';
  // 'All files (*.*)|*.*|Wave files (*.wav)|*.wav|Midi files (*.mid)|*.mid|Video for Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Otro'; // 'Other';
  SMCIOverlay = 'Overlay';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'Sequencer';
  SMCIVCR = 'VCR';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'Codigo de error desconocido'; // 'Unknown error code';

  SBoldItalicFont = 'Negrita italica'; // 'Bold Italic';
  SBoldFont = 'Negrita'; // 'Bold';
  SItalicFont = 'Italica'; // 'Italic';
  SRegularFont = 'Normal'; // 'Regular';

  SPropertiesVerb = 'Propiedades'; // 'Properties';

  SServiceFailed = 'El servicio fallo en %s: %s'; // 'Service failed on %s: %s';
  SExecute = 'ejecuta'; // 'execute';
  SStart = 'inicio'; // 'start';
  SStop = 'parada'; // 'stop';
  SPause = 'pausa'; // 'pause';
  SContinue = 'continuar'; // 'continue';
  SInterrogate = 'pregunta'; // 'interrogate';
  SShutdown = 'apagado'; // 'shutdown';
  SCustomError = 'El servicio fallo en mensaje personalizado (%d): %s'; // 'Service failed in custom message(%d): %s';
  SServiceInstallOK = 'Servicio instalado satisfactoriamente'; // 'Service installed successfully';
  SServiceInstallFailed = 'Error al instalar el servicio "%s". Error: "%s"'; // 'Service "%s" failed to install with error: "%s"';
  SServiceUninstallOK = 'Servicio desinstalado satisfactoriamente'; // 'Service uninstalled successfully';
  SServiceUninstallFailed = 'Error al desintalar el servicio "%s". Error: "%s"'; // 'Service "%s" failed to uninstall with error: "%s"';

  SInvalidActionRegistration = 'Accion de registro no valida'; // 'Invalid action registration';
  SInvalidActionUnregistration = 'Accion de eliminacion del registro no valida'; // 'Invalid action unregistration';
  SInvalidActionEnumeration = 'Accion de enumeracion no valida'; // 'Invalid action enumeration';
  SInvalidActionCreation = 'Accion de creacion no valida'; // 'Invalid action creation';

  SDockedCtlNeedsName = 'El control de acoplamiento debe tener un nombre'; // 'Docked control must have a name';
  SDockTreeRemoveError = 'Error al eliminar el control del arbol de acoplamiento'; // 'Error removing control from dock tree';
  SDockZoneNotFound = ' - Zona de acoplamiento no encontrada'; // ' - Dock zone not found';
  SDockZoneHasNoCtl = ' - Zona de acoplamiento no tiene un control'; // ' - Dock zone has no control';

  SAllCommands = 'Todos los comandos'; // 'All Commands';

  SDuplicateItem = 'La lista no permite duplicados ($0%x)'; // 'List does not allow duplicates ($0%x)';

  STextNotFound = 'Texto no encontrado: "%s"'; // 'Text not found: "%s"';
  SBrowserExecError = 'No hay navegador especificado por defecto'; // 'No default browser is specified';

  SColorBoxCustomCaption = 'Personalizar...'; // 'Custom...';

  SMultiSelectRequired = 'El modo Multiselect debe estar activado para esta opcion'; // 'Multiselect mode must be on for this feature';

  SKeyCaption = 'Clave'; // 'Key';
  SValueCaption = 'Valor'; // 'Value';
  SKeyConflict = 'Una clave con el nombre "%s" ya existe'; // 'A key with the name of "%s" already exists';
  SKeyNotFound = 'Clave "%s" no encontrada'; // 'Key "%s" not found';
  SNoColumnMoving = 'goColMoving no es una opcion soportada'; // 'goColMoving is not a supported option';
  SNoEqualsInKey = 'La clave podria no contener signos igual ("=")'; // 'Key may not contain equals sign ("=")';

  SSendError = 'Error al enviar el correo'; // 'Error sending mail';
  SAssignSubItemError = 'No se puede asignar un subelemento a un ActionBar cuando uno de sus ancestros ya esta asignado a un ActionBar';
   // 'Cannot assign a subitem to an actionbar when one of it''s parent''s is already assigned to an actionbar';
  SDeleteItemWithSubItems = 'El elemento %s tiene subelementos. Eliminar de todos modos ?'; // 'Item %s has subitems, delete anyway?';
  SMoreButtons = 'Mas botones'; // More Buttons';
  SErrorDownloadingURL = 'Error en la descarga URL: %s'; // 'Error downloading URL: %s';
  SUrlMonDllMissing = 'Error Monitoriando la URL: %s'; // 'Error';
  SAllActions = '(Todas las acciones)'; // '(All Actions)';
  SNoCategory = 'Ninguna categoria'; // '(No Category)';
  SExpand = 'Expandir'; // 'Expand';
  SErrorSettingPath = 'Error al establecer la ruta: "%s"'; // 'Error setting path: "%s"';
  SLBPutError = 'Intentando colocar elementos en una ListBox de estilo virtual'; // 'Attempting to put items into a virtual style listbox';
  SErrorLoadingFile = 'Error en la carga del archivo de configuracion previamente guardado: %s'#13'Le gustaria eliminarlo ?'; // 'Error loading previously saved settings file: %s'#13'Would you like to delete it?';
  SResetUsageData = 'Inicializar todos los datos del usuario ?'; // 'Reset all usage data?';
  SFileRunDialogTitle = 'Ejecutar'; // 'Run';
  SNoName = '(Sin nombre)'; // '(No Name)';
  SErrorActionManagerNotAssigned = 'El ActionManager primero debe ser asignado'; // 'ActionManager must first be assigned';
  SAddRemoveButtons = '&Añadir o eliminar botones'; // '&Add or Remove Buttons';
  SResetActionToolBar = 'Inicializar Toolbar'; // 'Reset Toolbar';
  SCustomize = '&Personalizar'; // '&Customize';
  SSeparator = 'Separador'; // 'Separator';
  SCirularReferencesNotAllowed = 'No se permiten referencias circulares'; // 'Circular references not allowed';
  SCannotHideActionBand = '%s no permite ocultarse'; // '%s does not allow hiding';
  SErrorSettingCount = 'Error al establecer %s.Count'; // 'Error setting %s.Count';
  SListBoxMustBeVirtual = 'El estilo del Listbox (%s) debe ser virtual para establecer Count'; // 'Listbox (%s) style must be virtual in order to set Count';
  SUnableToSaveSettings = 'Incapaz de guadar la configuracion'; // 'Unable to save settings';
implementation
end.


