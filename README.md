# Öğrenci Listesi Uygulaması (Student List App)

Bu proje, Flutter ve **Cubit** durum yönetimi (State Management) kütüphanesi kullanılarak geliştirilmiş basit bir öğrenci listeleme uygulamasıdır. Proje, Flutter'da modern durum yönetimi yaklaşımlarından biri olan Cubit'in temel kullanımını göstermeyi amaçlamaktadır.

## 🚀 Projenin Amacı

Bu projenin temel hedefleri şunlardır:
-   `flutter_bloc` paketi içindeki **Cubit**'in nasıl kullanılacağını göstermek.
-   Durum yönetimi (State Management) kavramını pratik bir örnekle açıklamak.
-   UI (Kullanıcı Arayüzü) katmanını iş mantığından (Business Logic) ayırmanın önemini vurgulamak.
-   `BlocProvider` kullanarak bir Cubit'in widget ağacına nasıl enjekte edileceğini göstermek.

## 🏛️ Proje Mimarisi ve Yapısı

Proje, basit ve anlaşılır bir klasör yapısı ve mimari deseni takip etmektedir.

-   **`main.dart`**: Uygulamanın giriş noktasıdır. Burada, uygulamanın en üst seviyesinde `BlocProvider` aracılığıyla `StudentCubit` oluşturulur ve tüm alt widget'ların bu Cubit'e erişimi sağlanır.
-   **`features/cubit/student_cubit.dart`**: Uygulamanın iş mantığını içeren durum yönetimi sınıfıdır. Öğrenci ekleme, silme, listeleme gibi işlemlerin mantığı burada yer alır.
-   **`features/view/home_view.dart`**: Kullanıcının öğrenci listesini gördüğü ve etkileşimde bulunduğu ana ekrandır. Bu ekran, `StudentCubit`'ten gelen duruma göre kendisini günceller.
-   **`product/theme.dart`**: Uygulamanın genel tema ayarlarını (renkler, fontlar vb.) içeren dosyadır.

### Durum Yönetimi (State Management)

Uygulama, durum yönetimi için `flutter_bloc` paketinin bir parçası olan **Cubit**'i kullanır.

1.  **`StudentCubit`**: `main.dart` içinde `BlocProvider` ile oluşturulur.
2.  **`BlocProvider`**: `StudentCubit`'i, altındaki tüm widget ağacının (`MaterialApp` ve dolayısıyla `HomeView`) erişebileceği şekilde "sağlar".
3.  **`HomeView`**: `BlocBuilder` veya `BlocListener` gibi widget'lar aracılığıyla `StudentCubit`'in durumunu dinler ve yeni bir durum (state) geldiğinde arayüzünü günceller.
    
