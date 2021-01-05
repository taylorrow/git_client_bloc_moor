import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_client_bloc_moor/data/moor/moor_database.dart';
import 'package:git_client_bloc_moor/presentation/bloc/github_search_bloc.dart';
import 'package:git_client_bloc_moor/presentation/bloc/github_search_event.dart';
import 'package:git_client_bloc_moor/presentation/bloc/github_search_state.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_SearchBar(), _SearchBody()],
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  GithubSearchBloc _githubSearchBloc;

  @override
  void initState() {
    super.initState();
    _githubSearchBloc = BlocProvider.of<GithubSearchBloc>(context);
    _githubSearchBloc.add(LoadDataFromGit());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
        controller: _textController,
        autocorrect: false,
        onChanged: (text) {
          _githubSearchBloc.add(
            TextChanged(text: text),
          );
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: GestureDetector(
            child: Icon(Icons.clear),
            onTap: _onClearTapped,
          ),
          border: InputBorder.none,
          hintText: 'Enter a search login',
        ),
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _githubSearchBloc.add(TextChanged(text: ''));
  }
}

class _SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      bloc: BlocProvider.of<GithubSearchBloc>(context),
      builder: (BuildContext context, GithubSearchState state) {
        if (state is LoadDataFromDBStateSuccess) {
          return state.items.isEmpty
              ? Text('No Results')
              : Expanded(child: _SearchResults(items: state.items));
        }
        if (state is SearchStateEmpty) {
          BlocProvider.of<GithubSearchBloc>(context).add(LoadDataFromDB());
          return Container();
        }
        if (state is SearchStateLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? Text('No Results')
              : Expanded(child: _SearchResults(items: state.items));
        }
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<GitUsersTableData> items;

  const _SearchResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(
          item: items[index],
          index: index,
        );
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final GitUsersTableData item;
  final int index;

  const _SearchResultItem({Key key, @required this.item, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: CircleAvatar(
          child: Image.network(item.image),
        ),
        title: Text('${item.id}. ${item.login}'),
        onTap: () async {
          if (await canLaunch(item.url)) {
            await launch(item.url);
          }
        },
      ),
    );
  }
}
