# GTFS grading scheme governance
1. [Stakeholder eligibility](#stakeholder-eligibility)
2. [Amendment process](#amendment-process)
3. [Editorial or syntactic changes](#editorial-or-syntactic-changes)

## Stakeholder eligibility
To be eligible to propose or vote on changes to the GTFS grading scheme, please register as a stakeholder of the GTFS grading scheme at specifications@mobilitydata.com with: 
- Name
- Github username
- Email
- Organization
- Use of grading scheme (e.g., as a tool for producing GTFS data, as a tool for assessing GTFS data from external sources)

Eligible stakeholders:
- Name (Github username @), Email, Organization

## Amendment process
Eligible stakeholders can make suggestions to change or expand the GTFS grading scheme. The process for proposing amendments is as follows:
1. Create a pull request containing the proposed change. 
     - Suggestions for changes must be supported by actual use cases accompanied by actual examples (i.e., as opposed to theoretical ones).
2. MobilityData screening and stakeholder feedback. 
     - The proposed change will be screened by MobilityData for its relevance, including any feedback from eligible stakeholders on the proposal.
3. MobilityData drafting or improvement of the proposed change.
4. Testing of the proposed change.
     - The creator of the issue or pull request must test the proposed change and provide results.
     - The proposed change must be demonstrated as useful to the creator.
5. The creator can call a vote on the proposed change at any time 7 days after the tests have demonstrated utility.
6. Voting lasts the minimum period sufficient to cover 7 full calendar days and 5 full Swiss business days. Vote ends at 23:59:59 UTC.
  	- The creator should announce the specific end time at the start of the vote.
  	- During voting period only editorial changes to the proposal are allowed (typos, wording may change as long as it does not change the meaning).
  	- Anyone is allowed to vote yes/no in a form of comment to the pull request, and votes can be changed until the end of the voting period.
    If a voter changes their vote, it is recommended to do it by updating the original vote comment by striking through the vote and writing the new vote.
  	- Votes before the start of the voting period are not considered.
7. The proposal is accepted if there is an unanimous consensus yes.
    - The creator's vote does not count.
    - Votes against shall be motivated, and provided with actionable feedback.
  	- If the vote has failed, then the creator may choose to continue work on the proposal, or to abandon the proposal.
  	- If the creator continues the work on proposal then a new vote can be called for at any point in time but no later than 30 calendar days after the end of the previous vote.
  	- If a vote was not called within 30 calendar days from the original proposal or 30 calendar days since end of the previous vote, then the proposal is abandoned.
8. If the proposal is abandoned, the corresponding pull request is closed.
9. If the proposal is accepted, MobilityData is committed to merging the voted upon pull request.

## Editorial or syntactic changes
Editorial or syntactic changes that provide clarity or disambiguation of the GTFS grading scheme without altering content will be arbitrated by MobilityData. Voting by the community is not required, and non-stakeholders can make editorial or syntactic changes. The process is as follows:
1. Create an issue or pull request containing the editorial or syntactic changes. Tag it as `Editorial`.
2. MobilityData screening.
3. MobilityData drafting or improvement of editorial or syntactic changes towards a finalized form.
4. MobilitiyData merge of editorial or syntactic changes into the official GTFS grading scheme documentation.

The GTFS grading scheme is maintained by MobilityData. 
