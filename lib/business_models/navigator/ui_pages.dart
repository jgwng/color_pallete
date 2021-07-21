const String MainPagePath = '/';
const String PalettePagePath = '/generate';
const String ErrorPagePath = '/error';

enum Pages{
 Main,
 Generate,
 Error
}

class PageConfiguration{
  final String key;
  final String path;
  final Pages uiPage;

  const PageConfiguration({required this.key, required this.path, required this.uiPage});
}

const PageConfiguration MainPageConfig =
PageConfiguration(key: "main",path: MainPagePath,uiPage: Pages.Main);

const PageConfiguration ErrorPageConfig =
PageConfiguration(key: "error",path: ErrorPagePath,uiPage: Pages.Error);

const PageConfiguration PalettePageConfig =
PageConfiguration(key: "generate",path: PalettePagePath,uiPage: Pages.Generate);

