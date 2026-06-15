Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E17CD98E1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZsI++GdKzD0pliGtk+CzTeP2Jh91crDziRR+z1eG2A=; b=x76M46P8kjEMga
	2fkiM7k22QKMi0WeKW+Ky/qIqx515dpQ8uBPqhCYAIZVCynXsyPHf1T/wo37dBO6wiCOTLknfjsRx
	l8qzK7cwBlgY1yH7+gn8drNYiHnnI8rOtNP84ByIn5GRp4TrsUB6F4s0T0sg09r2Jiw/+I12oiF0D
	/O3OFRBqY0wKfxuJHONxPp5cJMJm/bQGM0co8cIWIQuGTZ0YrksJNUzkX4IXVAdtEDpe37qbOKp4e
	U8WEhg0zvrjIT1Ryf0CmK4RKV5/baYQICosuT9GNhKVmMZAltmaA6P5hdVhi1YPBUdmny8J7Y6qgk
	jqG+p3vDIdFE6ZL3IzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9tG-0000000EXz0-3Xfo;
	Mon, 15 Jun 2026 16:10:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9tE-0000000EXyL-49sY
	for linux-snps-arc@lists.infradead.org;
	Mon, 15 Jun 2026 16:10:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7891A43211;
	Mon, 15 Jun 2026 16:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5681F000E9;
	Mon, 15 Jun 2026 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539820;
	bh=b7O/iX8ZXf9+ETUEbNQJOgOfGswd15/Oz6mytb/pT90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OUEma+3u83c0WZamH6riqLuFbxXAAGPEndgpJDLcE658tAQHZIq4NRTbExHLaQwct
	 /2VbAphR70z01LnEPwK7lDSR+h43fx5Xl6kri8wEPa4AL9DiRXljNc9c06nABkeuya
	 IUaqGmP3F5mq6FQD2YzvjrhJiJWUQFX2zbBGP4mtOvMz5GOXPt8s50Fii1GIL0+Igl
	 Gs++T/pi8dYU71N08stJBdTa39iWDjglW+Gf3hAJIASZnT59rO/kALPOSSanq8R3Rw
	 aQiqegpypPj2cevXkyInQB24AWfW0UpuCKsEJ5NSWce/K4V8Vt2Ckr5xuM5QCqbPG1
	 OsPd7fpJBcGwQ==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Mon, 15 Jun 2026 18:08:59 +0200
Subject: [PATCH 03/19] arc: define DPS root partition type UUID
MIME-Version: 1.0
Message-Id: <20260615-discoverable-root_partitions-v1-3-39c78fac42e2@kernel.org>
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
In-Reply-To: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
 linux-snps-arc@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=9rZS9bTuDmSM/994XMcxvjwv7RdqUU6T4byJTl6W7zg=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFkGylfOr9WS7LkdJiZTzfFVbGmu/r1LoW3n/ywOtip+H
 NRz+nRqx0QWBjEuBksxRZZl5ZzcCh2F3mGH/lrCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 QIaOEQMXpwBMtXEzw1+piq9LVmXN229V/c7kw1a9LYzC6zktVHj1Iu5OCk/trMhjZFj1vLVi1l3
 3rHAGsdN/ky3ZZ3L/zrq6+/r2M7MrjBflXGUGAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

DPS [1] assigns GPT partition type UUIDs to operating system partitions.
Root partitions use architecture-specific type UUIDs so the OS can
discover the intended root filesystem without relying on a root= cmdline
option.

Define DPS_ROOT_PARTITION_TYPE_UUID in asm/dps_root.h for ARC and select
ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID.

[1] The Discoverable Partitions Specification (DPS)
Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/arc/Kconfig                | 1 +
 arch/arc/include/asm/dps_root.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 2ed7186c81c5..cc3a57a0111f 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -10,6 +10,7 @@ config ARC
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
diff --git a/arch/arc/include/asm/dps_root.h b/arch/arc/include/asm/dps_root.h
new file mode 100644
index 000000000000..c9db3ddf1a53
--- /dev/null
+++ b/arch/arc/include/asm/dps_root.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_ARC_DPS_ROOT_H
+#define _ASM_ARC_DPS_ROOT_H
+
+#define DPS_ROOT_PARTITION_TYPE_UUID "d27f46ed-2919-4cb8-bd25-9531f3c16534"
+
+#endif /* _ASM_ARC_DPS_ROOT_H */

-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
