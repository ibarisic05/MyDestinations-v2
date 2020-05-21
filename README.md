# Razvoj mobilnih aplikacija - LV 2
Druga po redu laboratorijska vježba iz kolegija Razvoj mobilnih aplikacija kroz koju će se studenti upoznati sa strukutrama i njihovom primjenom, UIAlertController-om i MKMapView-om. 

Prvi dio vježbe će staviti fokus na Struct-ove i kako ih možemo iskoristiti za konfiguriranje UIView elemenata kroz cijelu aplikaciju. Generiranje custom klase za UITableViewCell koji smo definirali u LV 1 i style-anje iste kroz definirane strukture.

Drugi dio vježbe je nadograditi aplikaciju kako bi ista mogla prikazati detalje destinacije (koristeći definirane strukture za style-anje UIView-ova) koji će uključivati prikaz na mapama, dodati prethodnoj aplikaciji logiku za uklanjanje postojećih destinacija kroz UITableViewRowAction-e uz upozorenje korisniku prije brisanja iste.

U trećem djelu vježbe ćemo iskoristiti Swift Package Manager kako bi unutar aplikacije dodali [SDWebImage](https://github.com/SDWebImage/SDWebImage) library koji ćemo koristiti za prikaz slike destinacije.

## MyDestinations - iOS
## Zadatak 1
- Proširiti Destination objekt da ima informacije o url-u slike, latitudi i longitudi destinacije
- Kreirati custom cell koji će u sebi prikazivati naslov i opis destinacije
- Kreirati strukturu pomoću koje ćemo style-ati cell (napraviti Extension na UILabel kako bismo mogli lakše aplicirati željeni style)
- Omogućiti brisanje cell-a pomoću UITableViewRowAction-a
- Dodati UIAlertController za potvrdu brisanja akcije

## Zadatak 2
- Kroz delegat metodu UITableView-a omogućiti prikaz detalja o destinaciji
- Detalji destinacije moraju sadržavati prikaz slijedećih stavki: id, naslov i opis destinacije (za style elemenata koji prikazuju id, naslov i opis koristiti strukturu koju smo definirali u prethodnom zadatku)
- Ukoliko destinacija ima unešene informacije o latitudi i longitudi dodati MKMapView i na mapi prikazati lokaciju odabrane destinacije
## Zadatak 3
- Kroz Swift Package Manager dodati SDWebImage kao external library
- Na listi svih destinacija editirati cell koji smo kreirali u prvom zadatku i na isti dodati UIImageView za prikaz slike (prikazati sliku pomoću SDWebImageView-a)
- Kada se otvore detalji destinacije, također dodati UIImageView i prikazati sliku destinacije unutar istoga
- Napomena: slika se prikazuje ukoliko je postavljena
# Korisni linkovi
- [Struct and Class](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html) - dodatne informacije o klasama i strukturama
- [Swift extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) - dodatne informacije o extension-ima u Swift-u
- [UIAlertController](https://developer.apple.com/documentation/uikit/uialertcontroller) - dokumentacija za UIAlertControlleru
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview) - dokumentacija za UITableView
- [MKMapView](https://developer.apple.com/documentation/mapkit/mkmapview) - dokumentacija za MKMapView
- [UIImageView](https://developer.apple.com/documentation/uikit/uiimageview) - dokumentacija za UIImageView
- [Package Manager](https://swift.org/package-manager/) - detaljan opis Swift Package Managera
- [SDWebImage](https://github.com/SDWebImage/SDWebImage) - library za dohvaćanje i cache slika 
