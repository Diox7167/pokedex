import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/stores/pokemonStore.dart';
import 'package:pokedex/ui/widgets/pokedex/pokemonListViewWidget.dart';
import 'package:pokedex/ui/widgets/pokedex/favoriteListViewWidget.dart';
import 'package:pokedex/utils/lowerCaseText.dart';

class PokedexScreen extends StatefulWidget {
  final Size screenSize;

  const PokedexScreen({Key key, this.screenSize}) : super(key: key);

  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  TextEditingController _searchTextController = TextEditingController();
  bool _isLoading = true;

  int _currentIndex = 1;

  List<String> selectedTypeList = [];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildSearchPokemonList(List<PokemonStore> pokemons) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          textCapitalization: TextCapitalization.none,
          onChanged: (v) {
            setState(() {});
          },
          inputFormatters: [
            LowerCaseText(),
          ],
          controller: _searchTextController,
          decoration: InputDecoration(
            icon: Icon(Icons.apps),
            border: InputBorder.none,
            hintText: 'Rechercher un Pokemon',
            hintStyle:
                TextStyle(color: Colors.grey[400], fontFamily: 'ArcadeClassic'),
          ),
        ),
      ),
    );
  }

  Widget selectedWidget(int _currentIndex, bool isLoading) {
    switch (_currentIndex) {
      case 0:
        {
          return FavoriteListViewWidget(
            pokemons: pokedex.pokemons,
            searchController: _searchTextController,
            isLoading: isLoading,
          );
        }
      case 1:
        {
          return PokemonListViewWidget(
            pokemons: pokedex.pokemons,
            searchController: _searchTextController,
            isLoading: isLoading,
          );
        }

      default:
        {
          return Container();
        }
    }
  }

  @override
  void initState() {
    super.initState();
    pokedex.getPokemons().then((v) {
      user.getFavorites();
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget listViewWidget(List<PokemonStore> pokemons) {
    return _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: RawScrollbar(
                radius: Radius.circular(20),
                thickness: 2,
                thumbColor: Colors.red,
                child: selectedWidget(_currentIndex, _isLoading),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'ArcadeClassic',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black),
      ),
      body: Column(
        children: [
          buildSearchPokemonList(pokedex.pokemons),
          Expanded(child: listViewWidget(pokedex.pokemons)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Pokedex',
          ),
        ],
      ),
    );
  }
}
