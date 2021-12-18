Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D19BC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbmDq9mdlDu86Rir0hVRhCha1eUPXfT+sqF2C94uoFk=; b=x5N6CVBclxNvOa
	GDzKelFoQW9zvTXFl5u0I22GQG1vtkOJ4qp1vZWIt3kT+4yiUd/NPzVueTLpiWA68XDNpQkUA3aIa
	vSnAVEMHzy+aIvOCj/8BXB3D5pkGM1m1FjjfDNw8zfKyoGO6M695bpSEsGfWezXvijAnRpjizrZKu
	te9CyErr0MIP4WJH33d6hLDIydBPcDLqiwy1Wux62pUVMceDZ4itAwM/DIRUwjwIUp6nB4hqcTBRD
	AHzNENmNh6mutBxncGD5Q1Q/NLLB3eBHxDIC6/ikEQOlNKX41/XnnbNus4ZPKTmdIznJBvA28KWrr
	rYON4lBOwmPTy1c24O5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh8N-00Ejsc-Nw; Sat, 18 Dec 2021 21:20:51 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh80-00EjYg-By; Sat, 18 Dec 2021 21:20:30 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so7492174otl.3; 
 Sat, 18 Dec 2021 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zfgimupqB4xhJIvLvGgrer31y9tj8J1RXghy7qnKugc=;
 b=qBSsByr5wgMGTMBtOR8VWBruHG7gI5rTpoBxIGIotdCHMEM8HTurhNEBXdSXJJ+vbp
 z4nZd0M39rMgvfX7n1BPLb5W4Fp5e0leIK5Oa7DbmdMHBOyxdk35npFt2mE/TvddHuI/
 Msp5Y52cWIKQii7zOSViL3Ww6EkCwTY013XJOUEO3bhPky4coYrmEAWuQbHOMj+/krEh
 Bq02bTDKA77Evur3WZMYyRFHf6eVuraNL3a/kRxjitzg+7c/cubCjCY3QhtIB3Tg8Tti
 s8SG5C4j5Z6VKW9y8SwSvFV+p7TtpXnOmfiJ0V0NksAo/lfqooBch0gV4OclKr3i12oe
 fPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zfgimupqB4xhJIvLvGgrer31y9tj8J1RXghy7qnKugc=;
 b=Qq5drl7K3iKOcjAR7DkeDpoANUqPoHvqzqfmDM5R+5hFa4vwF87dqfTM8u3LruRG9Z
 nP+wtx/kPevRBCGqL3WJJhlGRTAuAN3FcWXqttXOOehLrfh/ySRGMlOtxT7kXlrlM9d1
 CSyK/PzDkWBgcXxS1ITf+OKTbC3D4VB7gswHqkdrAuvIFYfAy6DaqYDpj1kBd/y3DYvp
 RdH2rseOLaY+R7Px8FTjJZnXidgWWchFijAhZ+CWjoEpjuSngi+YtYENZGsLQP7iTMsY
 2ggE+gRCgJrddr6ZbCd0wtskZnBq4A3rIxhT4J/bm3c+bbMDcUYhqtt7FEv+ZKs1oQMk
 BuJQ==
X-Gm-Message-State: AOAM531BvtLU6aVemYdBMWPf9kg2Sk5QNceXqKIBhyhDrC2nUcRmgift
 NNP+GEjbrcKjGNlTlqHDTQQ=
X-Google-Smtp-Source: ABdhPJwIylU9xFoADkyS/ZsNIhCh+muyVjquH8ZgDzjT4LGhQhjnFx091zqSLOoLPp8knGVEvtv/Vw==
X-Received: by 2002:a9d:6052:: with SMTP id v18mr1040027otj.238.1639862427318; 
 Sat, 18 Dec 2021 13:20:27 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id k17sm2285241oom.6.2021.12.18.13.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:27 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/17] fix open-coded for_each_set_bit()
Date: Sat, 18 Dec 2021 13:19:59 -0800
Message-Id: <20211218212014.1315894-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132028_480532_E7D46ED0 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Mellanox driver has an open-coded for_each_set_bit(). Fix it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx4/cmd.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/cmd.c b/drivers/net/ethernet/mellanox/mlx4/cmd.c
index e10b7b04b894..c56d2194cbfc 100644
--- a/drivers/net/ethernet/mellanox/mlx4/cmd.c
+++ b/drivers/net/ethernet/mellanox/mlx4/cmd.c
@@ -1994,21 +1994,16 @@ static void mlx4_allocate_port_vpps(struct mlx4_dev *dev, int port)
 
 static int mlx4_master_activate_admin_state(struct mlx4_priv *priv, int slave)
 {
-	int port, err;
+	int p, port, err;
 	struct mlx4_vport_state *vp_admin;
 	struct mlx4_vport_oper_state *vp_oper;
 	struct mlx4_slave_state *slave_state =
 		&priv->mfunc.master.slave_state[slave];
 	struct mlx4_active_ports actv_ports = mlx4_get_active_ports(
 			&priv->dev, slave);
-	int min_port = find_first_bit(actv_ports.ports,
-				      priv->dev.caps.num_ports) + 1;
-	int max_port = min_port - 1 +
-		bitmap_weight(actv_ports.ports, priv->dev.caps.num_ports);
 
-	for (port = min_port; port <= max_port; port++) {
-		if (!test_bit(port - 1, actv_ports.ports))
-			continue;
+	for_each_set_bit(p, actv_ports.ports, priv->dev.caps.num_ports) {
+		port = p + 1;
 		priv->mfunc.master.vf_oper[slave].smi_enabled[port] =
 			priv->mfunc.master.vf_admin[slave].enable_smi[port];
 		vp_oper = &priv->mfunc.master.vf_oper[slave].vport[port];
@@ -2063,19 +2058,13 @@ static int mlx4_master_activate_admin_state(struct mlx4_priv *priv, int slave)
 
 static void mlx4_master_deactivate_admin_state(struct mlx4_priv *priv, int slave)
 {
-	int port;
+	int p, port;
 	struct mlx4_vport_oper_state *vp_oper;
 	struct mlx4_active_ports actv_ports = mlx4_get_active_ports(
 			&priv->dev, slave);
-	int min_port = find_first_bit(actv_ports.ports,
-				      priv->dev.caps.num_ports) + 1;
-	int max_port = min_port - 1 +
-		bitmap_weight(actv_ports.ports, priv->dev.caps.num_ports);
 
-
-	for (port = min_port; port <= max_port; port++) {
-		if (!test_bit(port - 1, actv_ports.ports))
-			continue;
+	for_each_set_bit(p, actv_ports.ports, priv->dev.caps.num_ports) {
+		port = p + 1;
 		priv->mfunc.master.vf_oper[slave].smi_enabled[port] =
 			MLX4_VF_SMI_DISABLED;
 		vp_oper = &priv->mfunc.master.vf_oper[slave].vport[port];
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
