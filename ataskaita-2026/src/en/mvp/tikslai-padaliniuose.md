# VU SR U Objectives

<script setup lang="ts">
import TimelineItemSection from '@/TimelineItemSection.vue'

const goals = {
  '1': [
    { type: 'success', content: 'Recommendations for improving course descriptions were prepared (based on problem analysis and Vilnius University study program regulations) and communicated to VU FCHG decision-makers (deans and the study council), who will encourage lecturers to review the descriptions of the courses they teach and make the necessary changes.' },
    { type: 'warning', content: 'Each SPC has approved improvements to the descriptions of two study subjects from each study program.' },
    { type: 'error', content: 'At least two of the course descriptions for each study program at VU FCHG are in a unified format and follow the template in accordance with the Vilnius University study program regulations.' },
  ],
  '2': [
    { type: 'success', content: 'A list of the student-selected teaching methods is created that students would like to see the most.' },
    { type: 'success', content: 'At least five lecturers have confirmed implementation of student-selected teaching methods in their subjects.' },
    { type: 'warning', content: 'The report of the results of the implemented teaching methods, containing student and lecturer opinions, is developed.' },
  ],
  '3': [
    { type: 'error', content: 'The learning platform provides access to 75% of the recordings of lectures on advanced mathematics I and II, thermodynamics, and mechanics.' },
    { type: 'success', content: 'There are 4 student learning sessions, with a total of at least 100 students participating.' },
    { type: 'not-planned', content: 'At least 75% of students who participated in the activities evaluate them positively.' },
  ],
  '4': [
    { type: 'warning', content: 'A working group and representatives have been approved, a list of review tasks has been prepared (template, language, ECTS ±10%), roles and contacts are clear.' },
    { type: 'not-planned', content: 'A proposal for the publication of open subject descriptions based on data and a set of recommendations have been prepared.' },
    { type: 'not-planned', content: 'During the meeting of the Council of the Faculty of Philology at Vilnius University, an agreement was reached to agree on the implementation schedule (template, deadline, publication), obligations, and responsible persons for the proposal.' },
    { type: 'not-planned', content: 'Virtual learning environment (VLE) is a new page whose update progress with uploaded subject descriptions is monitored by at least 5 people.' },
  ],
  '5': [
    { type: 'success', content: 'The Faculty of Philosophy at Vilnius University has prepared guidelines for the use of AI.' },
    { type: 'warning', content: 'Approved guidelines for the use of AI by the VU FPhis Council.' },
    { type: 'warning', content: 'VU FPhis students and lecturers are informed about the possibilities of using DI and the approved guidelines for using DI through at least 4 communication channels.' },
  ],
  'gmc': [
    { type: 'warning', content: 'The survey revealed that 10% of students found their internship through the internship website.' },
    { type: 'warning', content: 'The improvement of the competencies of internship supervisors has been implemented.' },
    { type: 'warning', content: 'At least 50% of respondents say they are aware of the internship process.' },
  ],
  '6': [
    { type: 'warning', content: 'Students from 10 modules state that Virtual Learning Environment (VLE) is the main communication platform for lecturers and students and is used consistently.' },
    { type: 'warning', content: '40% of VU FH students complete a survey on feedback received from lecturers.' },
  ],
  '7': [
    { type: 'warning', content: 'A systematic analysis of feedback provided to students has been prepared, based on data from student opinion surveys.' },
    { type: 'warning', content: 'Students in each study program group are informed about the importance of feedback, its forms, and know that they must receive it within the specified two-week period.' },
    { type: 'not-planned', content: 'Lecturers are familiarized with the importance of feedback for the student learning process, provided with clear suggestions on appropriate forms of feedback, and recommended frequency of provision – within two weeks after assessment.' },
    { type: 'warning', content: 'VU FC decision-makers accept the proposals submitted by VU SR FC and apply them in order to improve the quality of feedback in the study process.' },
  ],
  '8': [
    { type: 'warning', content: 'VU SR KF has published a methodology for providing high-quality feedback.' },
    { type: 'warning', content: 'Information about feedback-related initiatives or campaigns is posted on at least three different communication channels (Facebook, Instagram, emails).' },
    { type: 'warning', content: 'At least one change related to feedback provision is accepted in all VU KF SPC.' },
    { type: 'warning', content: 'In the survey, more than 60% of participating students have provided or received high-quality feedback.' },
  ],
  '9': [
    { type: 'success', content: 'The completion rate of the 2025–2026 fall semester survey in is.vu.lt for first and second cycle study programs increased by 3% compared to the 2024–2025 fall semester survey.' },
    { type: 'warning', content: 'At least three initiatives to improve teaching qualifications are implemented, based on proposals from VU SR FM.' },
    { type: 'warning', content: 'At least six study modules have either implemented or planned changes that are beneficial to students.' },
  ],
  '10': [
    { type: 'success', content: 'At least 70% of student representatives submit at least one reasoned proposal or comment on improving the quality of studies during SPC meetings.' },
    { type: 'warning', content: 'At least 35% of student feedback cases discussed by the SPC must have implemented recommendations for improving teaching quality.' },
    { type: 'warning', content: 'At least 3 different communication initiatives (events, training, publications, videos, etc.) have been implemented to highlight the importance of quality feedback.' },
  ],
  '11': [
    { type: 'success', content: '80 percent of respondents to a survey on the satisfaction of community needs by events and initiatives organized by VU ŠA say that their community needs are being met.' },
    { type: 'success', content: 'At least 150 students participated in events and initiatives organized in collaboration with other educational institutions, as well as in career planning activities.' },
  ],
  '12': [
    { type: 'warning', content: '20 percent of students who responded to VU IS surveys say that VU FL lecturers and seminar leaders provide feedback.' },
    { type: 'success', content: 'In a survey created by VU SR FL, at least 100 VU FL students provided feedback on lecturers over the course of a year.' },
    { type: 'success', content: 'VU FL students, lecturers, and seminar leaders are familiar with the feedback system.' },
  ],
  '13': [
    { type: 'warning', content: 'VU IIRPS page has updated information about exchange opportunities.' },
    { type: 'warning', content: 'At least 50% students that went on exchange have used the mentorship network.' },
    { type: 'warning', content: 'A collaborative partnership with at least 15 international institutions is established.' },
  ],
  '14': [
    { type: 'error', content: 'A problem analysis document has been uploaded to the VU SR BS archive.' },
    { type: 'error', content: 'More than 30% of respondents participating in modules taught by lecturers providing constructive feedback state that the quality of feedback they received has improved.' },
    { type: 'error', content: 'A report summarizing the results of completed focus groups and surveys, constructive feedback provided by lecturers, and adopted changes has been published through at least one VU SR BS communication channel.' },
  ],
}
</script>

## VU SR FCHG

The descriptions of VU FCHG study subjects have been reviewed and at least two descriptions of each study program subject have been improved, based on changes in teaching practices, assessment, literature, and the study subject description template.

<TimelineItemSection :items="goals['1']" :english="true" />

::: tip ☑️ What has been implemented?

- A clear and structured presentation of recommendations has been prepared, reflecting students’ expectations (based on an analysis of the issue and the regulations governing study programs at Vilnius University) regarding the infomation that should be included in course descriptions. This presentation was delivered to the Vice Dean of the Faculty of Chemistry and Geography at Vilnius University, Doc. Dr. Tatjana Kochane.

- During the meeting of the VU FCHG Academic Council, the chairs of the Study Program Committees (SPC) were informed about the issue of the preparation of inappropriate or incorrect courses (modules), which is relevant to the faculty community, and recommendations were proposed regarding the information provided in course descriptions. The recommendations were forwarded for further consideration to ensure that the information reaches all instructors.

- Focus groups were conducted to evaluate and gather feedback on the alignment of the actual implementation of courses with the courses offered in the various study programs at VU FCHG. Meetings were held for all study programs (except for the MA program “Cartography”), which revealed that almost all programs have course descriptions that need to be revised and improved.

- Following the focus groups and the analysis, a proposal was formulated to update the descriptions of at least three courses in each program. In total, different proposals were formulated for 37 course descriptions.

- Proposals to revise course descriptions were submitted to 22 of the 37 instructors.

- Descriptions for 9 courses were updated.

:::

## VU SR FEBA

VU FEBA lecturers have implemented student-selected teaching methods which students find beneficial.

<TimelineItemSection :items="goals['2']" :english="true" />

::: tip ☑️ What has been implemented?

- A survey was created and distributed, allowing VU FEBA students to express their opinions on additional teaching methods used in the study process. A total of 93 students expressed their opinions in the survey.

- The survey results showed that students would most like to see the following additional learning methods incorporated into the study process: attending lectures by guest speakers, working more in groups, and holding lectures at company facilities.

- A description was prepared for the selected study methods, outlining specific examples and descriptions of how the methods could be applied in the learning process. The description was subsequently provided to the selected lecturers.

- Five instructors were willing to collaborate on implementing the teaching methods chosen by the students. The following faculty members incorporated new learning methods into their teaching methodologies: Doc. Dr. Laimutė Urbšienė (an auction simulation game was additionally conducted in the course “Financial Markets and Securities”), Dr. Greta Keliuotytė-Staniulėnienė (in the course “Technical and Fundamental Analysis of Financial Markets,” group discussions were incorporated, during which students could earn extra points), Dr. Brigita Šidlauskienė-Riazanova (the “Kahoot” platform was used in the course “International Economics,” and guest speakers were invited), Dr. Jelena Stankevičienė (in the course “Fundamentals of Finance,” visits to companies were organized, the Bloomberg Lab was utilized, group discussions were held, and the “Slido” platform was used), Dr. Neringa Ramanauskė (in the course “Microeconomics I,” the “Slido” platform was used to earn extra credit).

- An additional survey was conducted in which students could indicate whether the supplementary teaching methods improved their learning experience.

:::

## VU SR FP

To improve the study environment and accessibility for first-year students at the Faculty of Physics of Vilnius University by introducing a culture of individual learning and providing information about study management options.

<TimelineItemSection :items="goals['3']" :english="true" />

::: tip ☑️ What has been implemented?

- VU FP has established study groups for first-year students. In implementing these study groups, 5 upperclassmen were identified to serve as leaders.

- The study groups, in which a total of about 100 students participated, were publicized through VU SR FP’s internal channels.

:::

## VU SR FPhil

At least 35% of BA and MA course descriptions for the 2025/2026 academic year, prepared using a unified template based on supporting materials developed by Vilnius University, are publicly available in the VU FPhil virtual learning environment (under "Course Descriptions"). Each description: (a) is prepared in the working language of the program (LT/EN/PL/RU), (b) matches the ECTS workload calculation (±10% margin of error).

<TimelineItemSection :items="goals['4']" :english="true" />

::: tip ☑️ What has been implemented?

- A VU SR FPhil working group has been formed to review and update course descriptions.

- Working group members and representatives participated in training sessions if they did not already possess the necessary skills. Working group members prepared recommendations for updating courses that require urgent updates.

- A meeting was held with the VU FPhil Studies Department, during which the identified issues were presented, an action plan was discussed, and feedback was received. It was agreed with the Studies Department not to create an open-access course in the VLE system, as this would duplicate the content of the VU IS, which is not populated with the necessary course descriptions. It was decided to review the current status of course descriptions and assess the necessary changes.

- A meeting was held with the Vice Dean for Academic Affairs at VU’s Faculty of Philology, to whom the issues and the preliminary recommendations prepared by the working group were presented. The most important areas for updates from the students’ perspective were discussed, as well as the possibility of addressing this issue at the Academic Council.

- The issue of updating course descriptions was raised in conjunction with the Study Department. The Study Department provided information regarding courses approved jointly by the Academic Council. Student representative Gabija Smailytė presented the issues, the contextual material gathered regarding the need for this matter, and the revised recommendations. An agreement was sought to ensure that this issue would be initiated not only by student representatives but also by the chairs of the Study Program Committees (SPCs), as the timely review of course descriptions is one of the SPCs’ functions. At the same time, building on a previous agreement by the College of Studies to update all course descriptions for the upcoming semester before publishing them—indicating the update date at the bottom of the course description—a request was made to thoroughly review the course descriptions, rather than merely updating the date.

- Instructions for reviewing course descriptions were prepared for representatives using preliminary recommendations. Currently, the instructions have been shared only among representatives; A tool for monitoring the progress of the course review has also been developed, in which courses are reviewed by separating individual courses from common BA required courses / PDs and common MA PDs, as the descriptions of these courses are also approved by the College of Studies This tool uses the study program grids published for the 2026 admissions cycle (unless they are not published this year).

- At least some of the course descriptions have been reviewed and comments provided for the following study programs: Intermedia Literature Studies, Lithuanian Philology, Lithuanian Philology: Culture and Media Studies, Lithuanian Philology: Editing, French Philology, Translation (BA).

- The Faculty of Philology at Vilnius University has developed and approved guidelines for the use of AI, which have been communicated to the faculty’s students and lecturers.

:::

## VU SR FPhis

VU FPhis has prepared and approved guidelines for the use of DI, which have been communicated to FPhis students and lecturers

<TimelineItemSection :items="goals['5']" :english="true" />

::: tip ☑️ What has been implemented?

- The annual goal and its relevance were presented at the VU Faculty of Philosophy Dean’s Office, and a separate meeting was held with the Vice Dean of the VU Faculty of Philosophy, Assoc. Prof. Dr. Jolanta Aleknevičienė. During these meetings, it was discussed how to implement artificial intelligence (AI) guidelines at the faculty and agreed on which relevant topics to include in them.

- A working group was formed, consisting of 5 lecturers from different institutes and 2 student representatives, who were briefed on the contextual information and drafted guidelines for the use of artificial intelligence (AI) at the faculty.

- A focus group was organized with students to discuss the need for regulation of artificial intelligence (AI). The focus group included bachelor's students in their second through fourth years, who shared their experiences using artificial intelligence (AI) in their studies. The key areas and most important themes regarding the need to regulate the use of artificial intelligence (AI) were identified: lack of clear communication, percentage-based definitions, artificial intelligence (AI) tools, differentiation in the use of artificial intelligence (AI) tools, disclosure and citation, AI search and verification, training, lecturers and students, and security aspects. Ten people participated in this focus group.

- Participated in a working group on AI regulation in written assignments. In this working group, students were represented by Gabrielė Šlepetytė, Academic Process Coordinator at VU SA FPhilos, and Austėja Pupelytė, Chair of VU SR FPhilos. The working group held one meeting, during which they discussed the main aspects of AI usage regulation and future work.

- A preliminary draft of the guidelines was presented at the Study Board meeting. During the Study Board meeting, a decision was made to approve the guidelines separately in each VU FPhilos Studies Program Committee (SPC).

- An event on the topic of AI use and academic literacy was held for students on April 16.

:::

## VU SR LSC

VU LSC students are provided with resources for choosing and completing internships, ensuring a functioning internship system.

<TimelineItemSection :items="goals['gmc']" :english="true" />

::: tip ☑️ What has been implemented?

- VU SR LSC prepared and conducted a survey aimed at determining whether the internship section on the VU LSC website helped students better understand the internship process and find an internship. A total of 176 students from the 2nd to 4th years, representing 7 different study programs, completed the survey. Of the students currently doing an internship, 70% indicated that it was easy to find an internship place, and as many as 97% of respondents stated that they were satisfied with their internship placement (LSC or another institution). 75% of students indicated that they did not know or were unsure where to look or whom to contact for help in finding an internship placement.

- An additional analysis of the VU LSC internship page was carried out, and recommendations were made to the administration aimed at updating the information on the page to make it clearer and help students choose an internship place more easily.

- Discussions were held with representatives of doctoral students, the doctoral school, and the Center for Didactics regarding internships and opportunities to enhance the competencies of internship supervisors. During the meetings, the idea was endorsed to organize training sessions involving a psychologist, an educator, or a didactics specialist, as well as a moderator, who could share their experiences on how to handle critical situations, how to prepare to supervise an internship, and what mistakes to avoid. It was agreed that doctoral students would receive 0.25 ECTS credits for participating in these training sessions.

- A new section titled “Professional Internships” has been added to the VU SR LSC website, featuring detailed information about internships, how to complete them, and the key steps to take before starting an internship. The page was developed in collaboration with the VU LSC administration.

- Students who had completed international internships were identified, and the vision for a communication campaign regarding the international internships offered by VU LSC not only within the unit but also with social partners in Lithuania and abroad was discussed.

:::

## VU SR FH

There is consistent communication between VU FH students and lecturers, based on feedback.

<TimelineItemSection :items="goals['6']" :english="true" />

::: tip ☑️ What has been implemented?

- The latest VU IS surveys were analyzed to compile a list of the 5 most frequently recurring issues related to the use of virtual learning environment (VLE).

- A meeting was held with the Vice Dean for Academic Affairs and International Relations, Assoc. Prof. Norbertas Černiauskas. During the meeting, the situation regarding the (non)use of the virtual learning environment (VLE) at the faculty was discussed, and guidelines for using the environment were presented to encourage lecturers to utilize virtual learning environment (VLE).

- Guidelines for the use of virtual learning environment (VLE) were developed for lecturers.

- Student representatives were selected to monitor and identify whether VLE is being used appropriately in the study process.

- Based on the feedback guidelines developed by the VU FPhilos, feedback guidelines tailored to the VU FH were created and subsequently distributed through various communication channels.

- At the general meeting of VU FH students, the results of the VU survey and related insights were presented, with particular emphasis placed on the importance of feedback.

- VU SR FH organized a survey on the feedback provided by lecturers, subsequently analyzed the results, and reached conclusions that will be used to further encourage feedback from lecturers.

:::

## VU SR FC

No less than 50% of students receive feedback on the courses in the autumn semester at VU FC no later than two weeks after the assessment

<TimelineItemSection :items="goals['7']" :english="true" />

::: tip ☑️ What has been implemented?

- During the VU SR FC freshman camp, activities were carried out to highlight the importance and relevance of feedback to the learning process.

- Six focus groups were held with student representatives and contact people from the VU FC Study Program Committees (SPC) to identify problem areas in the process of providing feedback by lecturers. These sessions revealed that the provision of feedback at the faculty is inconsistent. Most students indicated that they lacked feedback after midterm assessments and also missed more detailed, personalized comments after presentations or exams. There was a need for instructors to clearly specify how they would provide feedback and how students could request it.

- A feedback guide was developed that is easy for students to understand, helping them recognize quality feedback and encouraging its use in the learning process.

- Upon identifying problematic areas, student representatives from the FC at Vilnius University held discussions with the relevant lecturers, presenting the current state of feedback. During these discussions, agreements were reached with 11 lecturers to provide feedback more frequently.

- Surveys were developed for each study program to assess the frequency and quality of feedback provided by lecturers during the fall semester, with a focus on the designated two-week period. These surveys were completed by 170 students. According to the survey results, it was found that 65% of instructors provide feedback to students within a two-week period following the assessment.

- VU SA FC shared a series of short-term posts on social media regarding the opportunity and necessity to agree with lecturers on methods for providing feedback and the designated two-week deadline for the spring semester.

- Feedback training sessions were organized for VU FC lecturers, led by VU ŠA Director Prof. Dr. Renata Bilbokaitė. During the training, lecturers were introduced to feedback methodologies, the benefits of feedback, and practical ways to receive and provide feedback. The lecturers’ feedback was positive, so the trainings are planned to be repeated in the future.

- The VU FC administration received a separate proposal from the VU SR FC regarding improving the quality of feedback provision in the study process.

:::

## VU SR KnF

Lecturers and students at VU Kaunas Faculty actively provide high-quality feedback.

<TimelineItemSection :items="goals['8']" :english="true" />

::: tip ☑️ What has been implemented?

- To improve the student experience during their studies, VU KnF developed a methodology for providing high-quality feedback, which has been published through various internal channels.

- Using the developed feedback methodology, a list of potential proposals for changes was prepared, which should be implemented by the VU KnF Study Program Committees (SPC).

- A meeting of the Study Council was held, during which the list of potential proposals was discussed and presented.

- A feedback guide was compiled and disseminated to VU KnF students via internal and external channels. The guide is available here.

:::

## VU SR FM

The Faculty of Medicine at Vilnius University has an internal study quality assurance system based on student feedback and meeting internal quality criteria.

<TimelineItemSection :items="goals['9']" :english="true" />

::: tip ☑️ What has been implemented?

- During meetings with persons of contact held in December and April, study-related issues relevant to students were discussed, and information was provided regarding solutions initiated by VU SR FM. It was reminded that issues related to the conduct of studies can be submitted by filling out a specialized form from the VU FM Studies Department or by informing student representatives in the study program committees (SPC).

- Via emails and social media, students were introduced to the VU SR FM Guidelines for Constructive Feedback—a document providing practical advice on how to submit precise, solution-oriented comments that would enable systematic improvements in the quality of studies.

- VU SR FM developed internal study quality criteria and discussed them with the VU FM administration and the Department of Educational Competencies. The document was shared with student representatives in VU FM units, emphasizing the analysis of study modules based on international standards and best practices.

- VU SR FM initiated a meeting with the Department of Educational Competencies of VU MF to enhance the quality of studies and the analysis of modules. During the meeting, student expectations regarding the strengthening of pedagogical competencies (including issues related to the quality of teaching methods and assessments) were discussed, as were the activities of student representatives on the Study Program Committees (SPC).

- Based on data from VU IS surveys and focus groups, student representatives from VU FM analyzed problematic study modules, taking student satisfaction into account. Analysis documents for 9 modules were prepared, and meetings were initiated with the lecturers coordinating the modules, providing constructive feedback.

- Six meetings were held with the lecturers coordinating the following modules: Human Physiology and Biochemistry (Kinesiotherapy SP); Fundamentals of Human Physiology (Pharmacy SP); Art Therapy; Rehabilitation (Art Therapy Program); Medical Vision Correction and the Application of Optometric Equipment in Medicine; The Visual System (Physics) and Its Correction Methods, as well as Optometric Examination Technologies. Vision Correction Methods (Optometry Program).

- Two additional meetings have been scheduled with the lecturers for the following courses: Pediatric Diseases and Physical Therapy, Development of Motor Control (Physical Therapy program); Life Sciences (Nursing program).

- During the meetings, plans were developed for improving the quality of the modules, including planned changes and their implementation deadlines. The plans include refining the course description, applying more engaging teaching methods, improving the quality of assessments, providing timely feedback to students after assessments, presenting clear and accessible literature sources, and the structured use of VLE.

- The results of the discussions were communicated to the program coordinators, and direct communication with students was being strengthened, ensuring the dissemination of information about ongoing and planned changes and the consistent continuity of the study quality improvement process.

:::

## VU SR FMI

The results of student feedback on teaching from study program surveys are systematically analyzed at VU FMI SPC meetings with the aim of ensuring that at least 35% of the cases discussed are followed up with at least one action to improve teaching competence based on the feedback received.

<TimelineItemSection :items="goals['10']" :english="true" />

::: tip ☑️ What has been implemented?

Training sessions were held for VU SR FMI representatives, during which student representatives were introduced to the specifics of their Student Representation, the annual schedule, and the expectations set forth. Together with student representatives, issues relevant to students were analyzed, and examples were provided on how to articulate existing problems and resolve them.

Individual meetings were held regularly with student representatives to discuss how they were feeling in their roles, their goals, and their future plans.

At least one area for improvement was identified in each study program (at the bachelor’s and master’s levels).

To implement changes in the study programs, SPC meetings were initiated to discuss the problems and possible solutions. The following meetings were held:

In response to student complaints, the Information Systems Engineering SPC replaced one instructor and began monitoring another instructor’s work more closely.

The Mathematics Teaching and Educational Measurement SPC proposed replacing a lecturer and merging two courses to improve their structure.

The Mathematics SPC initiated the replacement of a lecturer due to issues with the quality of teaching.

The Data Science and Business Data Analytics Program Committee updated several courses, addressed issues related to the quality of studies, and made decisions to improve the program.

The issue of publishing student data in the Bachelor’s Program in Program Systems was resolved.

To raise community awareness and engagement, a lecture was organized for members of the VU SR FMI during training sessions held in November, during which the importance of feedback for the quality of studies was presented and how to complete surveys accurately and constructively was discussed. A communication campaign was carried out in December–January to publicize information about the benefits and importance of feedback, as well as practical examples of its application. An additional communication phase is also planned for May to ensure the continued dissemination of information.

:::

## VU SR ŠA

Events and initiatives organized by VU ŠA that promote a (shared) academic spirit and consistent career planning.

<TimelineItemSection :items="goals['11']" :english="true" />

::: tip ☑️ What has been implemented?

- A survey was conducted to identify the needs of students and the VU ŠA community regarding the organization of various events. The survey showed that community members would like to have more events in informal settings, as well as more active or sports-related activities. Lecturers who participated in the survey also expressed the need to organize events outside lecture hours, while students themselves expressed a willingness to contribute to such events.

- Collaboration was carried out with Šiauliai State College and the Šiauliai Technology Training Center regarding potential events and opportunities for cooperation.

- To achieve the annual goal, the following events were organized: a Halloween party (VU SR ŠA with ŠVK SR); Cake Day at ŠA (VU SR ŠA with VU ŠA); celebration of International Students’ Day during the “International Dinner” event (VU SR ŠA with VU ŠA); a festive movie night (VU SR ŠA with VU ŠA); a Valentine’s evening (VU SR ŠA with ŠVK SR); and an International Women’s Day celebration (VU SR ŠA with ŠVK SR).

:::

## VU SR FL

VU FL has developed and implemented a unified feedback system aimed at improving the quality of the academic process.

<TimelineItemSection :items="goals['12']" :english="true" />

::: tip ☑️ What has been implemented?

- To identify the needs of Faculty of Law students regarding feedback, a six-person focus group was organized with contact persons from all years of study, and students’ opinions about the feedback provided by lecturers were collected.

- Existing issues related to feedback were discussed with the Head of the Department of Public Law, Johan Baltrimas; the Head of the Department of Criminal Justice, Ilona Mihailovič; the Head of the Department of Private Law, Vida Petrylaitė; and the Chair of the Study Program Committee, Rimantas Simaitis.

- A meeting was organized with the Vice-Dean for Studies, Vigita Vėbraitė, during which students’ feedback about lecturers, arguments expressed by department heads and the Study Program Committee chair, and VU SR TF’s plans to prepare a faculty-wide feedback procedure document were discussed.

- A document regulating the feedback process was prepared, taking into account VU academic ethics and study regulations, Lithuanian legal acts, and best practices from other VU faculties and higher education institutions. The prepared document was presented to and approved by the Faculty Dean’s Office and the Study Program Committee.

- Activities were implemented during the VU SR TF freshman camp to introduce the importance and relevance of feedback in the study process.

- Information about feedback, its benefits, and its relevance to studies was shared on VU SR TF social media and internal communication channels. In addition, a year-round survey allowing students to provide feedback about lecturers was prepared and published.

:::

## VU SR IIRPS

VU IIRPS ensures an effective exchange process for outgoing students through efficient communication, logistical and academic support, and strong international partnerships.

<TimelineItemSection :items="goals['13']" :english="true" />

::: tip ☑️ What has been implemented?

- To improve the experience of outgoing exchange students, a meeting was organized with students who had previously participated in exchanges. During this meeting, it was identified that students lacked communication and assistance with filling out documents, clear information presentation, and practical advice.

- The current information provided to students before departure for exchanges was reviewed. The analysis revealed inaccurate information and identified universities with which agreements had expired.

- A mentor network was established in which students share their exchange experiences. The network currently consists of 13 students. Before launching the initiative, training sessions were organized by the International Student Affairs Coordinator of the VU SR Central Office together with the Institute administration.

- During the organization of an exchange presentation event at the Institute, the newly established mentor program and its objectives were also presented. It is planned to continue this in the coming years.

- Student representative bodies from six foreign universities in Germany, Poland, Switzerland, Austria, and Sweden were contacted. Individual discussions and three webinars were organized to better understand and inform students about the universities’ social and academic environments.

:::

## VU SR BS

At the Business School, Vilnius University, a two-way meeting model between student representatives and lecturers is being developed, during which study subjects are improved based on feedback collected throughout the semester.

<TimelineItemSection :items="goals['14']" :english="true" />

::: tip ☑️ What has been implemented?

- To identify the scale and number of issues faced by BS students, focus groups were organized during which students presented challenges encountered throughout their studies.

:::
