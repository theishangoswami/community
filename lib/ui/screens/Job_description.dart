// import 'package:flutter/material.dart';
//
// class ChatBox extends StatefulWidget {
//   @override
//   _ChatBoxState createState() => _ChatBoxState();
// }
//
// class _ChatBoxState extends State<ChatBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CHATS"),
//       ),
//       body: Container(
//
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   late TextEditingController firstName;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Heyy User"),backgroundColor: Colors.grey,),
//       body:ListView(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 13),
//                 child: Align(
//                   alignment:Alignment.topLeft,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 43,
//                     child: Text("S",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Text("Shivam Agarwal".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25)),
//                   Text("Shalimar Garden, Sahibabad",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12)),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 35,
//           ),
//           Container(
//             height: 598,
//               width: 400,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(35),
//               ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 27,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 60),
//                   child: Card(
//                     shadowColor: Colors.black,
//                       elevation:10,child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGO4Zhkl9YoGtzCPbIYAnDIUZqxnHy5bqVsw&usqp=CAU")),
//                 ),
//                SizedBox(
//                  height: 20,
//                ),
//                const Padding(
//                   padding: EdgeInsets.only(left:61,right: 61),
//                   child: Card(
//                     elevation: 5,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             border: UnderlineInputBorder(),
//                             labelText: 'Your name',
//                             hintText: 'Fill your name'
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 14,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left:61,right: 61),
//                   child: Card(
//                     elevation: 5,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             border: UnderlineInputBorder(),
//                             labelText: 'Your age',
//                             hintText: 'Fill your age'
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 80),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 22,
//                       ),
//                       GestureDetector(child: Text("MALE".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.brown))),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 34),
//                         child: Container(
//                           color: Colors.black,
//                           height: 59,
//                           width: 3
//                         ),
//                       ),
//                       GestureDetector(child: Text("FEMALE".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white,))),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 23,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 125),
//                   child:Card(
//                     elevation: 7,
//                     shadowColor: Colors.black,
//                     child: Container(
//                       height: 40,
//                       width: 120,
//                       child: Center(child: Text("SUBMIT",style: TextStyle(color: Colors.black),)),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(35),
//                       ),
//                     ),
//                   )
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 165,vertical: 11),
//                   child: Text("By JIL Limited".toUpperCase(),style: TextStyle(fontSize: 7,color: Colors.white),),
//                 )
//               ],
//             ),
//           )
//         ],
//       ) ,
//     );
//   }
// }
import 'package:community_internal/core/models/job.model.dart';
import 'package:community_internal/core/repository/jobs.repository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetails extends StatefulWidget {
  final JobModel jobModel;

  const JobDetails({Key? key, required this.jobModel}) : super(key: key);
  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final JobRepository _jobRepository = JobRepository();
  void applyForJob(String jobId, String userId) async {
    final response = await _jobRepository.applyJob(jobId, userId);
    if (response) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              height: 40,
              width: 50,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6YPdq33xIQpx_EY_eCrU95tVOJT3I4cJCnw&usqp=CAU",
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${widget.jobModel.jobsTitle}".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Job Description'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Container(color: Colors.black, height: 3, width: 154),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  widget.jobModel.description ?? "NA",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                child: Text(
                  'Requirements'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "While you may be tempted to list every requirement you expect from for your ideal candidate, if you include too many qualifications and skills this could dissuade potential applicants.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ...{
                "Gender": widget.jobModel.gender,
                "Education": widget.jobModel.education,
                "Experience": widget.jobModel.experience,
                "Location": widget.jobModel.location
              }
                  .entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    e.key,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Text(":  "),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    (e.value?.isNotEmpty ?? false)
                                        ? (e.value ?? "NA")
                                        : "NA",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      applyForJob(widget.jobModel.id!, widget.jobModel.userId!);
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 14,
                          ),
                          child: Text(
                            'Apply for job'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
