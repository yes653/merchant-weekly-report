-- ============================================================
-- 商户准入周报数据库约束升级脚本
-- 在 Supabase SQL Editor 中执行此脚本
-- https://app.supabase.com → 你的项目 → SQL Editor
-- ============================================================

-- 1. 商户准入表：防止同一人同周重复录入
-- 先检查是否有重复数据需要清理
DO $$
DECLARE
    dup_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO dup_count FROM (
        SELECT week, person, COUNT(*)
        FROM merchant_weekly
        GROUP BY week, person
        HAVING COUNT(*) > 1
    ) AS dups;
    
    IF dup_count > 0 THEN
        RAISE NOTICE '⚠️ 发现 % 组重复数据，建议先手动清理后再添加唯一约束', dup_count;
    ELSE
        RAISE NOTICE '✅ 无重复数据，可以安全添加约束';
    END IF;
END $$;

-- 添加唯一约束（确认清理重复后执行）
-- ALTER TABLE merchant_weekly ADD CONSTRAINT uq_merchant_week_person UNIQUE (week, person);

-- 2. 二级户审核表：防止同一周重复录入（每业务周只应有一条汇总记录）
DO $$
DECLARE
    dup_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO dup_count FROM (
        SELECT week, COUNT(*)
        FROM audit_weekly
        GROUP BY week
        HAVING COUNT(*) > 1
    ) AS dups;
    
    IF dup_count > 0 THEN
        RAISE NOTICE '⚠️ 发现 % 组重复数据', dup_count;
    ELSE
        RAISE NOTICE '✅ 无重复数据';
    END IF;
END $$;

-- 添加唯一约束
-- ALTER TABLE audit_weekly ADD CONSTRAINT uq_audit_week UNIQUE (week);

-- 3. 性能索引（加速按周筛选和排序）
-- CREATE INDEX IF NOT EXISTS idx_merchant_week ON merchant_weekly (week DESC);
-- CREATE INDEX IF NOT EXISTS idx_merchant_person ON merchant_weekly (person);
-- CREATE INDEX IF NOT EXISTS idx_audit_week ON audit_weekly (week DESC);
