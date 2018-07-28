From: leon@kernel.org (Leon Romanovsky)
Date: Sat, 28 Jul 2018 10:54:41 +0300
Subject: [PATCH RESEND] ARC: [plat-eznps] Add missing struct
 nps_host_reg_aux_dpc
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180728075441.6950-1-leon@kernel.org>
To: linux-snps-arc@lists.infradead.org

From: Ofer Levi <oferle@mellanox.com>

Fixing compilation issue caused by missing struct nps_host_reg_aux_dpc
definition.

Fixes: 3f9cd874dcc87 ("ARC: [plat-eznps] avoid toggling of DPC register")
Reported-by: Randy Dunlap <rdunlap at infradead.org>
Signed-off-by: Ofer Levi <oferle at mellanox.com>
---
 arch/arc/plat-eznps/include/plat/ctop.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index 0c7d110..bd34b96 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -143,6 +143,15 @@ struct nps_host_reg_gim_p_int_dst {
 };

 /* AUX registers definition */
+struct nps_host_reg_aux_dpc {
+	union {
+		struct {
+			u32 ien:1, men:1, hen:1, reserved:29;
+		};
+		u32 value;
+	};
+};
+
 struct nps_host_reg_aux_udmc {
 	union {
 		struct {
--
1.7.1
