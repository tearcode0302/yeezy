enum StepType {
  dataLoad('데이터 로드'),
  authcheck('인증 체크');

  const StepType(this.name);
  final String name;
}