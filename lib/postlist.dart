part of "timeline.dart";

class PostList extends StatelessWidget {
  final List<Post> post;

  PostList({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text(post[index].title ?? 'adrian screwed up - error code 1',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                  subtitle: Text(post[index].subtitle ?? 'adrian screwed up - error code 1'),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc){
                          return Container(
                            child: new Wrap(
                              children: <Widget>[
                                new ListTile(
                                    title: Text(post[index].title ?? 'adrian screwed up - error code 1',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                                    onTap: () => {}
                                ),
                                new ListTile(
                                    title: Text(post[index].subtitle ?? 'adrian screwed up - error code 1',
                                        style: TextStyle(fontSize: 20.0)),
                                    onTap: () => {}
                                ),
                                new ListTile(
                                  title: new Text(post[index].body ?? 'Error code 1 - You shouldn\'t be seeing this message right now! If you are, please email adrian.marcus.widjaja@gmail.com.'),
                                  onTap: () => {},
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.calendar_today),
                                  title: new Text(post[index].date ?? 'adrian screwed up - error code 1'),
                                  onTap: () => {},
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.access_time),
                                  title: new Text(post[index].time ?? 'adrian screwed up - error code 1'),
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
