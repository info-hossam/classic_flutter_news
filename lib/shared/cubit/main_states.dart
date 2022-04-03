abstract class MainStates {}

class MainAppInitState extends MainStates {}

class MainAppChangeBottomNavigationBarCurrentIndexState extends MainStates {}

///ALL NEWS STATES///

class MainAppGetWholeDataLoadingState extends MainStates {}

class MainAppGetWholeDataSuccessState extends MainStates {}

class MainAppGetWholeDataErrorState extends MainStates {}

///TOP HEADLINES STATES///

class MainAppGetTopHeadlinesLoadingState extends MainStates {}

class MainAppGetTopHeadlinesSuccessState extends MainStates {}

class MainAppGetTopHeadlinesErrorState extends MainStates {}
