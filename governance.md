# GTFS grading scheme governance
1. [Stakeholder eligibility](#stakeholder-eligibility)
2. [Amendment process](#amendment-process)
3. [Editorial or syntactic changes](#editorial-or-syntactic-changes)

## Stakeholder eligibility
To be eligible to propose or vote on changes to the GTFS grading scheme, please register as a stakeholder of the GTFS grading scheme at specifications@mobilitydata.com with: 
- Name
- GitHub username
- Email
- Organization
- Use of grading scheme (e.g., as a tool for producing GTFS data, as a tool for assessing GTFS data from external sources)

Eligible stakeholders:
- GitHub username @, Organization

## Amendment process
Eligible stakeholders can make suggestions to change or expand the GTFS grading scheme. The process for proposing amendments is as follows:
1. Create a pull request containing the proposed change. 
     - Suggestions for changes must be supported by actual use cases accompanied by actual examples (i.e., as opposed to theoretical ones).
2. MobilityData monitoring of proposal and stakeholder feedback. 
3. Testing of the proposed change.
     - The creator of the issue or pull request must test the proposed change and provide results.
     - The proposed change must be demonstrated as useful to the creator.
4. Proposed changes are formally reviewed on a period of 6 months. At which point MobilityData will call a vote.
5. Voting lasts a minimum period sufficient to cover 7 full calendar days. Vote ends at 23:59:59 UTC.
  	- MobilityData will announce the specific end time at the start of the vote.
  	- During voting period only editorial changes to the proposal are allowed (typos, wording may change as long as it does not change the meaning).
  	- Elegible stakeholders are allowed to vote yes/no in a form of comment to the pull request, and votes can be changed until the end of the voting period.
    If a voter changes their vote, it is recommended to do it by updating the original vote comment by striking through the vote and writing the new vote.
  	- Votes before the start of the voting period are not considered.
6. The proposal is accepted if there is a majority vote yes.
    - The creator's vote does not count.
    - Votes against shall be motivated, and provided with actionable feedback.
  	- If the vote has failed, then the creator may choose to continue work on the proposal, or to abandon the proposal.
  	- If the creator continues the work on proposal then a new vote can be called for at any point in time but no later than 30 calendar days after the end of the previous vote.
  	- If a vote was not called within 30 calendar days from the original proposal or 30 calendar days since end of the previous vote, then the proposal is abandoned.
7. If the proposal is abandoned, the corresponding pull request is closed.
8. If the proposal is accepted, MobilityData is committed to merging the voted upon pull request.

## Editorial or syntactic changes
Editorial or syntactic changes that provide clarity or disambiguation of the GTFS grading scheme without altering content will be arbitrated by MobilityData. Voting by the community is not required, and non-stakeholders can make editorial or syntactic changes. The process is as follows:
1. Create an issue or pull request containing the editorial or syntactic changes. Tag it as `Editorial`.
2. MobilityData screening.
3. MobilityData drafting or improvement of editorial or syntactic changes towards a finalized form.
4. MobilityData merge of editorial or syntactic changes into the official GTFS grading scheme documentation.

## Versioning
Semantic versions of the GTFS Grading Scheme are represented in the form of `vX.Y.Z` where `X.Y.Z` is the version name:
- `X`: Breaking changes.
- `Y`: Added features.
- `Z`: Editorial or syntactic changes.

Proposals for breaking changes (`X`) and added features (`Y`) are reviewed and voted on a period of 6 months, at which point the versioning of the grading scheme will be updated if there are changes. Editorial changes (`Z`) are monitored and implemented on a rolling basis, as they do not require a vote. 

The GTFS grading scheme is maintained by [MobilityData](https://mobilitydata.org/). 
