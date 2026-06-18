/**
 * 商户准入周报数据
 * 更新数据只需要修改这个文件，然后告诉我重新部署即可
 */
const REPORT_DATA = {
  // 最后更新时间
  lastUpdated: '2026-06-18',

  // 填写人列表
  persons: ['张三', '李四', '王五'],

  // 商户准入数据（按周录入）
  // week 格式：'2026-W24' 表示2026年第24周
  merchant: [
    // 示例数据，请替换为实际数据
    { week: '2026-W23', person: '张三', merchApprove: 12, merchReject: 3 },
    { week: '2026-W23', person: '李四', merchApprove: 8, merchReject: 2 },
    { week: '2026-W23', person: '王五', merchApprove: 15, merchReject: 1 },
    { week: '2026-W24', person: '张三', merchApprove: 10, merchReject: 4 },
    { week: '2026-W24', person: '李四', merchApprove: 9, merchReject: 1 },
    { week: '2026-W24', person: '王五', merchApprove: 13, merchReject: 2 },
  ],

  // 二级户审核数据（按周录入）
  // sysApprove=系统审核通过, sysReject=系统审核驳回
  // manApprove=人工审核通过, manReject=人工审核驳回
  audit: [
    { week: '2026-W19', sysApprove: 397, sysReject: 88, manApprove: 125, manReject: 146 },
    { week: '2026-W20', sysApprove: 563, sysReject: 174, manApprove: 393, manReject: 355 },
    { week: '2026-W21', sysApprove: 431, sysReject: 143, manApprove: 412, manReject: 331 },
    { week: '2026-W22', sysApprove: 410, sysReject: 139, manApprove: 312, manReject: 298 },
    { week: '2026-W23', sysApprove: 354, sysReject: 130, manApprove: 263, manReject: 310 },
    { week: '2026-W24', sysApprove: 379, sysReject: 145, manApprove: 284, manReject: 386 },
    { week: '2026-W25', sysApprove: 370, sysReject: 91, manApprove: 213, manReject: 215 },
  ],
};
