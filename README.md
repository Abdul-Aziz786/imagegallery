# imagegallery

## Getting Started

To run this project, create a `.env.dev` file and add the API key.

Then generate the Riverpod and env code:

```
dart run build_runner clean && dart run build_runner build
```

## Architecture

The app is split by feature. Each feature owns its screen, its state, and the code that loads or saves its data.

```
lib/
  core/                 theme, router, Dio, API key
  features/gallery/     search and browse photos
  features/favorites/   save and list favorites
  features/image_detail/ view, share, and download one photo
```

Inside a feature, files are grouped by job:

- **domain** is the photo itself: `GalleryImage` and `GalleryPage`. No network or widgets.
- **data** talks to the outside world. Gallery calls Pixabay. Favorites reads and writes SharedPreferences. Image detail downloads the file and saves it to the photo library.
- **presentation** is what the user sees. A screen composes small widgets. A controller holds the state those widgets read.

`core` is only the shell shared by every feature: theme, navigation, the HTTP client, and the API key.

## State management

State is held in Riverpod providers, declared with `@Riverpod`. `main.dart` wraps the app in `ProviderScope`.

A screen does not watch every provider. Each widget watches only what it draws:

- `GallerySearchField` sends the search text to `GalleryController`.
- `GalleryGrid` reads that controller and shows the paged photo list.
- `ThemeToggleButton` watches the theme provider.
- `FavoriteButton` watches the favorites list for the open photo.

`GalleryController` keeps the current search text. The photo pages themselves live in a `PagingController`: it asks Pixabay for the next page, and `refresh()` reloads from the first page when the search changes or the user pulls to refresh.

`FavoritesController` loads the saved photos at startup and updates that list when a photo is added or removed. The new list is written back to SharedPreferences.

`keepAlive: true` is set on these providers so a search, the favorites list, and the theme stay in memory when you open a photo and come back.
