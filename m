Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB823C761A6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 Apr 2023 10:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XhskJ39yRnm6ZEmyG7zdoPNY8syX3vHgi2yamK7GlPc=; b=tO8PLHuYJw0D4D
	u81Zy4VE3wKtMY53RKsW/Dk/gK/D6pSAxLoeGg46OwNIlCVICYoHBW4uYn5anAQeLJ8AqPfD3Gh0+
	j2Nl26AYwYSNcM2dhqDAVX3CMUgiazJjcUHwMETs3c9VNW2VuEo/6R9IKHoL1lHHCjPwY/3UfqneG
	ATft8eu1aohrDp20ZnfFEQU8AcmUbvUsifq7mP9MB9ZytC5ja0MPoB5j3AdFZLbfxo6yP9QG2ct+w
	Mwx8Vi7bge/i/Hxe0d9r6M1fkFGdkozRGR+b8Rl5A2RRlWn8j0+AB0zi8bbr/+6zcIupeabjoOCUo
	DOM3GAD94qbrLGMQ2/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeBh-000vyT-0c;
	Tue, 04 Apr 2023 10:46:53 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeBe-000vul-1X
	for linux-snps-arc@lists.infradead.org;
	Tue, 04 Apr 2023 10:46:51 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3348gu5c019996;
	Tue, 4 Apr 2023 03:46:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=pfptdkimsnps; bh=HhTYuSDUy/Mi5Ee7SAoennZL+pTqPoRwJtRYTnq9UcU=;
 b=Nzq1q2eBf+UvnXeLN7KGzTOBxpoH3JF1u5btEtgCsFpfX+6A7fvaR3Jz3MbtMIY5MW4p
 QyNspue2WnQtueVqIqqbPaPopxN/qr+0BQItP0GBYf5oRw8grKCayNcr++Yj7tRiAX1R
 rcJciCxwSpADPQ9O/NGOajVfYivT6r94soNQ6zeoRot0t2j18Ar5MWEgXo4INEVh34pT
 ildW+o8hGK3byeOwiMWqReny5d/cu1u/oxp7/FqlS9+ZY+zhcLuir/hvx81725ACLwFh
 0pzk1187T+GMyDVTldj5PDSvGbn+WhxzugCySJ9c4sl9bwUjQzmE0MqAgBQl6Ab3VfCz ig== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkhxedhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 03:46:37 -0700
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F22BA400D9;
	Tue,  4 Apr 2023 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1680605196; bh=5cCPFXr+LnfgzV/0NmXn+mk3q0rrcMzWb4fJk8bv7Vw=;
	h=From:To:Cc:Subject:Date:From;
	b=hkUChZ/REp3z4LfAMGdBQkfNV18OcJXiW6M2AeZeZ6U60KYQEcosPc8ZewAh7GP0n
	 kGelD2MEGMF4qzMck+1AgNMTJFlTPtloJqkwlqX7iZoliFgYeUP5O54T0Vo+4PCOyY
	 JnIfcEcssg5jBAqSkDAw6bdnz4wy6OSb9fdJ4oDk/Zp0/ogO2GY+EmE5kSDa2KfG36
	 rnnL3FkcSejTw9xpqO37PUrsDrCF/WKsdk+nxhmmgun+/Ois07DCAi+I8l6CGSr9uR
	 agBbDhGIhjSZnnfVRdHjudSouJty1Vz+pa8bKBGonjM6Jz3PWwP8HwyiO7aUiLh6Qt
	 XJeveiF50mlqA==
Received: from debian-vm.internal.synopsys.com (unknown [10.116.106.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 8543BA005E;
	Tue,  4 Apr 2023 10:46:33 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Nikolay Agishev <Nikolay.Agishev@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: vgupta@kernel.org, peterz@infradead.org,
        Nikolay Agishev <Nikolay.Agishev@synopsys.com>
Subject: [PATCH] Fix backtrace message from arc_pmu_device_probe()
Date: Tue,  4 Apr 2023 14:45:48 +0400
Message-Id: <20230404104548.388019-1-agishev@synopsys.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Proofpoint-GUID: vnqk3YHMuVsFqXstWPzPhRlOmHbI_38Y
X-Proofpoint-ORIG-GUID: vnqk3YHMuVsFqXstWPzPhRlOmHbI_38Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_03,2023-04-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304040098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_034650_632344_EA29BD4D 
X-CRM114-Status: GOOD (  15.07  )
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

this_cpu_ptr() call causes backtrace with CONFIG_DEBUG_PREEMPT=y
because it required non-preemptive mode.

Stack Trace:
  arc_unwind_core+0xe8/0x118
  dump_stack_lvl+0x2c/0x40
  check_preemption_disabled+0xb4/0xb8
  arc_pmu_device_probe+0x336/0x3c8
  platform_probe+0x30/0x80
  really_probe.part.0+0x8c/0x248
  driver_probe_device+0x86/0x1e8
  __driver_attach+0x8a/0x144
  bus_for_each_dev+0x38/0x64
  bus_add_driver+0x112/0x178
  driver_register+0x4c/0xdc
  do_one_initcall+0x30/0x110
  kernel_init_freeable+0x14a/0x1b0

Suggested fix turns off preemption for the routine call.

Signed-off-by: Nikolay Agishev <agishev@synopsys.com>
---
 arch/arc/kernel/perf_event.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index adff957962da..10bbdc2dab01 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -806,10 +806,14 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 			arc_pmu->irq = irq;
 
+			get_cpu_ptr(&arc_pmu_cpu);
+
 			/* intc map function ensures irq_set_percpu_devid() called */
 			ret = request_percpu_irq(irq, arc_pmu_intr, "ARC perf counters",
 						 this_cpu_ptr(&arc_pmu_cpu));
 
+			put_cpu_ptr(&arc_pmu_cpu);
+
 			if (!ret)
 				on_each_cpu(arc_cpu_pmu_irq_init, &irq, 1);
 			else
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
