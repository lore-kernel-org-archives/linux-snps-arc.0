From: christophe.leroy@c-s.fr (Christophe Leroy)
Date: Wed,  5 Dec 2018 04:41:09 +0000 (UTC)
Subject: [PATCH 1/2] mips/kgdb: prepare arch_kgdb_ops for constness
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <75bbcdd1e9277d66ebb06e349dda304bd01ce761.1543957194.git.christophe.leroy@c-s.fr>
To: linux-snps-arc@lists.infradead.org

MIPS is the only architecture modifying arch_kgdb_ops during init.
This patch makes the init static, so that it can be changed to
const in following patch, as recommended by checkpatch.pl

Suggested-by: Paul Burton <paul.burton at mips.com>
Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
---
 arch/mips/kernel/kgdb.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/kgdb.c b/arch/mips/kernel/kgdb.c
index eb6c0d582626..31eff1bec577 100644
--- a/arch/mips/kernel/kgdb.c
+++ b/arch/mips/kernel/kgdb.c
@@ -394,18 +394,16 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 	return -1;
 }
 
-struct kgdb_arch arch_kgdb_ops;
+struct kgdb_arch arch_kgdb_ops = {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	.gdb_bpt_instr = { spec_op << 2, 0x00, 0x00, break_op },
+#else
+	.gdb_bpt_instr = { break_op, 0x00, 0x00, spec_op << 2 },
+#endif
+};
 
 int kgdb_arch_init(void)
 {
-	union mips_instruction insn = {
-		.r_format = {
-			.opcode = spec_op,
-			.func	= break_op,
-		}
-	};
-	memcpy(arch_kgdb_ops.gdb_bpt_instr, insn.byte, BREAK_INSTR_SIZE);
-
 	register_die_notifier(&kgdb_notifier);
 
 	return 0;
-- 
2.13.3
