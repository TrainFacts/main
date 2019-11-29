part of "timeline.dart";

class PostKnight extends StatelessWidget {
  final List<Post> post;

  PostKnight({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text(post[index].title ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                  subtitle: Text(post[index].subtitle ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error'),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc){
                          return Container(
                            child: new Wrap(
                              children: <Widget>[
                                new ListTile(
                                    title: Text(post[index].title ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                                    onTap: () => {}
                                ),
                                new ListTile(
                                    title: Text(post[index].subtitle ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error',
                                        style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)),
                                    onTap: () => {}
                                ),
                                new ListTile(
                                  title: new Text(post[index].body ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error'),
                                  onTap: () => {},
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.calendar_today),
                                  title: new Text(post[index].date ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error'),
                                  onTap: () => {},
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.access_time),
                                  title: new Text(post[index].time ?? 'ERROR: Exception Code 1 – trainfacts.github.io/error'),
                                  onTap: () => {},
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }
              ));
        });
  }
}


/* BACKUP OF PhotosList CLASS

class PhotosList extends StatelessWidget {
  final List<Post> post;

  PhotosList({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text(post[index].title ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                  subtitle: Text(post[index].subtitle ?? ''),
                  onTap: () {

                  }
              ));
        });
  }
}
*/
