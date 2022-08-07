uuid: package use for generate Unique ID(String).

SOME CHANGES

addPost,
addComment,
addLike,
updateUserProfile [required UserModel rether then List of strings , image should be declared as a List<int> (Uint8List)]

In each Data Model like (JobModel, CommunityModel.. other) 'id' is required & NOT nullable parameter. i suggest to remove '?'.😉

According to Given API you should use @community.model, @society.model and repos 
Why? Basically, the society's API data in your project is stored in the community model and the Community APi data is not stored/fetch anywhere.

View Community 
url:https://mydemoweb.online/community_app/admin/api/community/view  (RETURN THIS DATA)
{"result": [{"id":"4","community_title":"baniya","status":"enable"},
{"id":"6","community_title":"guniyty","status":"enable"},
{"id":"8","community_title":"brahman","status":"enable"}]}

View Society Media 
url:https://mydemoweb.online/community_app/admin/api/society/view   (RETURN Some think like this)

 {
    "id": id,
        "user_id": userId,
        "society_name": societyName,
        "society_city_id": societyCityId,
        "community_id": communityId,
        "society_address": societyAddress,
        "society_documents": societyDocuments,
        "society_logo": societyLogo,
        "person": person,
        "status": status,
        "date": date,
      }
