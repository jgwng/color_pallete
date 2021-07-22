import 'package:colorpallete/business_models/navigator/ui_pages.dart';
import 'package:colorpallete/main.dart';
import 'package:colorpallete/ui/views/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaletteRouterDelegate extends RouterDelegate<PageConfiguration> with ChangeNotifier,
    PopNavigatorRouterDelegateMixin<PageConfiguration>{
  late final List<Page> _pages = [];

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;


  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }


  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  void _removePage(Page? page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pages.remove(route.settings);
    notifyListeners();
    return true;
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );

  }

  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;
    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.Main:
          _addPageData(HomePage(), MainPageConfig);
          break;
        case Pages.Generate:
          _addPageData(MyHomePage(), MainPageConfig);
          break;
        default:
          break;
      }
      notifyListeners();
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    _pages.clear();
    addPage(configuration);
    return SynchronousFuture(null);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
    notifyListeners();
  }

  void popTwice() {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      _pages.removeLast();
    }

    notifyListeners();
  }
  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();

    }
    addPage(newRoute);
    notifyListeners();
  }
}