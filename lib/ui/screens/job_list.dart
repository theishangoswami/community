import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_internal/app/constants.dart';
import 'package:community_internal/core/models/job.model.dart';
import 'package:community_internal/core/repository/jobs.repository.dart';
import 'package:community_internal/core/services/key_storage.service.dart';
import 'package:community_internal/ui/screens/member_profile.dart';
import 'package:community_internal/ui/widgets/dummy_drawer.dart';
import 'package:community_internal/ui/widgets/user_avatar.dart';
import 'package:community_internal/widgets/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Job_description.dart';
import 'create_job.forum.dart';

class JobList extends StatefulWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> with AutomaticKeepAliveClientMixin {
  List<JobModel> jobs = [];
  @override
  void initState() {
    super.initState();
    fetchAllJobs();
  }

  fetchAllJobs() async {
    setState(() {
      isBusy = true;
    });
    jobs = await JobRepository().getAllJobs();
    if (mounted) {
      setState(() {
        isBusy = false;
      });
    }
  }

  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = StorageService().getCurrentUser();
    return LoadingHelper(
      isLoading: isBusy,
      child: Scaffold(
        // drawer: const DummyDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Job Openings".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: UserAvatar(
                  radius: 50,
                  imgUrl: user!.profile,
                ),
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MemberProfileScreen(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton.extended(
          elevation: 7,
          onPressed: () async {
            var res = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateJobForum(),
              ),
            );
            if (res == true) {
              fetchAllJobs();
            }
          },
          label: const Text(
            'POST JOB',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 20,
          ),
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (BuildContext context, int index) {
            var job = jobs.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: GestureDetector(
                onTap: () async {
                  final response = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobDetails(
                        jobModel: job,
                      ),
                    ),
                  );
                  if (response) {
                    fetchAllJobs();
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: Constants.imageBaseUrl +
                                (job.companyLogo ?? ""),
                            errorWidget: (_, __, ___) => Image.network(
                              "https://bigstep.com/assets/images/blog/webservers.jpg",
                              fit: BoxFit.fitHeight,
                            ),
                            placeholder: (_, __) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${job.jobsTitle} | ${job.companyName ?? "NA"}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "POST ON ${DateFormat('yMd').format(job.date!)}  |  ${DateFormat('yMd').format(job.endDate!)} ",
                                //   "Posted on ${job.date?.toIso8601String() ?? "NA"}",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Rs ${job.packages ?? "NA"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
