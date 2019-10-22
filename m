Return-Path: <SRS0=+sMG=YP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEE1CA9EA0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2019 14:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCCE21783
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2019 14:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0t6HZWj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gUpL5SAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FCCE21783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vUJ9GIvTq5Vxlw/T/AAKByEy/J+IH7eq1c1xEGbutWk=; b=Z0t
	6HZWjPt66tr0UgaFLEx2WUQJtrYrw41akMjgin11OdWqUOSTvqmK8kyL6Srqy8kzi/aVKDKg4O/fk
	OkJORMrJyxfLCM8YJtxvLHVzI88X6PHte7pKpaSADzzl6ZqYxPqcSC2Pl7bFc3g2UgB/RATBW4xUB
	/MdPWtJ+FreY5bzWy0klPhKAp2Yeoukl+4lTTXpaXuERhcvoENK43YrcQ94hwIHDAwwdOo47a7Zh2
	lLYn468TjZTwliqX+YNAgUpR7U+q7J4AgGWwo5jho0PmIfhIhZN56pLFXMoQK25dEBjh92OjslI95
	RJepHRDRUTqCA4iFNhCuLIzQuNFKv/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMumt-000052-6l; Tue, 22 Oct 2019 14:05:27 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMuls-0006L1-FI
 for linux-snps-arc@lists.infradead.org; Tue, 22 Oct 2019 14:04:26 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2495DC0D58;
 Tue, 22 Oct 2019 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571753061; bh=PlFMRCj9hMpOe7fD5AdKfYzQfRNkA41VuXOPF/zY0I4=;
 h=From:To:Cc:Subject:Date:From;
 b=gUpL5SAIZnWNDGO7a7mPmwl+MZsM4kZ/WNmGkOAhaybPAIxG93H+Md4ylWbSmYM4u
 G2HeqRFYlpkzD/FtIhHyQAcixWNH/HqEZHT3Xil5C+L6xZJwb7ZDTmy5nA55tajZWc
 DgnY4zmdYgUwRnJaaA5ifsvMZPC1aslwSzaS10lndy8u+kEQadASEcfzmPNiYP4Dht
 WIBc1YathvVxpEaLQWHg9/y0O8blWzbxCfnNPH3vWhFd+Q4wz3/iH10m7yxgBTGwZs
 6oNmYp6EP/Tlxa0gm1rWNAZd1Io4M+FmB495C2Aoj4SoATtLn5P20WrCx6CS3xFxWa
 okEiGQG5PoYCA==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id CA9CDA005D;
 Tue, 22 Oct 2019 14:04:13 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: perf: Accommodate big-endian CPU
Date: Tue, 22 Oct 2019 17:04:11 +0300
Message-Id: <20191022140411.10193-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_070424_570264_4D876A4B 
X-CRM114-Status: GOOD (  14.64  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

8-letter strings representing ARC perf events are stores in two
32-bit registers as ASCII characters like that: "IJMP", "IALL", "IJMPTAK" etc.

And the same order of bytes in the word is used regardless CPU endianness.

Which means in case of big-endian CPU core we need to swap bytes to get
the same order as if it was on little-endian CPU.

Otherwise we're seeing the following error message on boot:
------------------------->8----------------------
ARC perf        : 8 counters (32 bits), 40 conditions, [overflow IRQ support]
sysfs: cannot create duplicate filename '/devices/arc_pct/events/pmji'
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.18 #3
Stack Trace:
  arc_unwind_core+0xd4/0xfc
  dump_stack+0x64/0x80
  sysfs_warn_dup+0x46/0x58
  sysfs_add_file_mode_ns+0xb2/0x168
  create_files+0x70/0x2a0
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at kernel/events/core.c:12144 perf_event_sysfs_init+0x70/0xa0
Failed to register pmu: arc_pct, reason -17
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.18 #3
Stack Trace:
  arc_unwind_core+0xd4/0xfc
  dump_stack+0x64/0x80
  __warn+0x9c/0xd4
  warn_slowpath_fmt+0x22/0x2c
  perf_event_sysfs_init+0x70/0xa0
---[ end trace a75fb9a9837bd1ec ]---
------------------------->8----------------------

What happens here we're trying to register more than one raw perf event
with the same name "PMJI". Why? Because ARC perf events are 4 to 8 letters
and encoded into two 32-bit words. In this particular case we deal with 2
events:
 * "IJMP____" which counts all jump & branch instructions
 * "IJMPC___" which counts only conditional jumps & branches

Those strings are split in two 32-bit words this way "IJMP" + "____" &
"IJMP" + "C___" correspondingly. Now if we read them swapped due to CPU core
being big-endian then we read "PMJI" + "____" & "PMJI" + "___C".

And since we interpret read array of ASCII letters as a null-terminated string
on big-endian CPU we end up with 2 events of the same name "PMJI".

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: stable@vger.kernel.org
---
 arch/arc/kernel/perf_event.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 861a8aea51f9..661fd842ea97 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -614,8 +614,8 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 	/* loop thru all available h/w condition indexes */
 	for (i = 0; i < cc_bcr.c; i++) {
 		write_aux_reg(ARC_REG_CC_INDEX, i);
-		cc_name.indiv.word0 = read_aux_reg(ARC_REG_CC_NAME0);
-		cc_name.indiv.word1 = read_aux_reg(ARC_REG_CC_NAME1);
+		cc_name.indiv.word0 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME0));
+		cc_name.indiv.word1 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME1));
 
 		arc_pmu_map_hw_event(i, cc_name.str);
 		arc_pmu_add_raw_event_attr(i, cc_name.str);
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
