Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6491CDC19F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Jan 2026 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3T2t+3KlQ8tqvyrVTUD5/+AOxLnZTacTvk4TmrdLxj0=; b=dqn7xRUvkkgqJ7
	z+UdZLPCZoS4e57srZSDmZAXQU3cSjM9sNmbAnCvlGzUTzqU246i2LHqunW9sEUjcinCd0lcJFOQV
	0FNic98YGFwlAq+nr0eDxvJGbNgK2iw7DWoE/Ly9ayr9GkMmP4OC1Ff0/yM2DE9/pFbm2xQbU09om
	UjNn2LVg8NGX1cDo0CvAg8lA7duajl+xzOmt2PLMUig+BNC4rivZBNUaZOKsmSCFOYdaFaGqqBvRA
	nBDI+0C4Bfq1wTH0Fl/7VNUuUggR7l4r8joZ5bq4D6Nw8EMr596rGIz+yF4ZmMf4sMdKwVqfEmbQV
	TpMmtysS2FyGLaS0wGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7Dt-0000000D6o0-2dWk;
	Tue, 06 Jan 2026 13:35:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7Do-0000000D6nc-3l6S
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Jan 2026 13:35:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AaHKV3073039
	for <linux-snps-arc@lists.infradead.org>; Tue, 6 Jan 2026 13:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3BezMpAsnXJy1On63INsMLm3Gwl8lfeJBQN
	spl/wUDU=; b=QT+6y4Mioqyr/h1B4UhlbgyPrCIBv4pgRofES+rUkOTwkvvetX6
	nO43C1CoCzPiHw2GxQRUtt/N3/vxUHYyIiQc7DfxIwHcDHE/LierurRB1/vDjCYv
	YlgjckNj62yjpXwd0UPLs1CMuW6JnvwTlW935jN+Lj3bd6NnVfeZzSqOZPVN1ek+
	ufAStPUaTBFcx3HLK0a4HYtfcz4GsyKekHcuqEtq4NrXH0uPVDMULrQvbqOhfUfX
	/wlEiZOZnyswZ1FYbo7+q1mkF5ifSgV0tFP7I5oT2ZLSWE7qHpe6bhG/8y6WiiPR
	lkcSPSQ8CrItjUFAAlZWKkcelogRtskdtvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7hy06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Tue, 06 Jan 2026 13:35:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so131760085a.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 06 Jan 2026 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706539; x=1768311339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BezMpAsnXJy1On63INsMLm3Gwl8lfeJBQNspl/wUDU=;
        b=SgtrgB60Q6Aa2IefyCN0GuYTWlxWUSj2aSq0dszGNcJ2JN97wUzt7D7yeCzNE4cuYB
         98fqclH+Ks+eOga6xYTa43vaFWLbs0dYwdjTYNbYuahhVBSC9qwbD408fWSvKc43ZcBu
         0ws8/9WJAG6gogKV+dw9CfkGVfFVQiWEyBEEisYuWSrQnCGdPfLa4lUw6h8IRUI3ECAr
         Jzfxf/cnnWoefKq8cUo0o13bvQGL/1wjWTyDzoIe3FmQhS+0k1Eo6rs2oVanm9sP7E+r
         u/Wu1JpcpeSjkGroPH0OSePgatOpfwcHmtvhNtJCq5Jjx7WVmurcgNB74Jz8vgp6+kvN
         HtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706539; x=1768311339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BezMpAsnXJy1On63INsMLm3Gwl8lfeJBQNspl/wUDU=;
        b=iXydpjaRvmfCJzDlPQiGcizm9LSKp/UzSitTFl2E4edKjdffdFWnnvVe7kQgfkhURf
         yP/6lUHdn8YhWOjjMwaI0W0+9HA5ZbWw+cXPxQGnFbF7SOr/Mr6yiArFIUlikKoAWRIu
         l4/Fw2k6z7/I3GTCbUVlVP+DtVFd+XTa2fdFOCj8zkiyTPtxOJZQt4mUZtYjZtuA4O0b
         FcJskR8Vpwhm22r+3ryjfXrBg9GfXKmhAvw6hhNa4x2942XhRIrtdEHWwD0MWGVF3u3Q
         3K3KVs08VfgJ8xSwBjPcCVMeaIuPkRtHlU/BadEZ/xJP/Dh7/1u4LWPRJVjsnSw5rOzb
         tiQA==
X-Gm-Message-State: AOJu0YyUpv8JwQ4gwanWnVX3iGZ8p01KWID2J/3mvQaC95csSqy0P/PT
	zABDanebnxOw0/nrKPknUY9mGrID57dO9wwNWyWVzCTLmpvGz4Uk6iUeAQG4uMFYQamqlgvUPhI
	nNvlyR6NWrdl/7Hdtz/Q3Iwp/1MVRXJeC/JPfwAHPudr/8sij+79LupgZFci4LIfS4ocLmF43lC
	c=
X-Gm-Gg: AY/fxX7j6LcwbT7Rs42bRyPAhbikwAVYKP0NNzZTPfoK4404oj4sdVZz/r0RkVS4FgS
	SAFgnDTvAaUBQqulQK9wJ32Lsxvmet2XcTN+suIB4CDW69Fdv08pJXjybTIKuXdfTtq9FIsWvpU
	Y9SM7nhxOoV+skYTRTVV3huOXlbigbgipBDG0ys2A/dQk55FfqAIWPReRzJhOYLoJSEyfgSgews
	MLOkOSiQK/HOo+lD+bBqkzMLLSQj+j1SatPRvRB3EfL2qJkX3EMsQ1gLPnUoCzxArFCWdnlGC7s
	SzYIL+RQbELiQ01n74kOGBbz2D/QPA27Y60+c/M8fvCyCiK4bMbSDxBsvIegx2Op/UAXpdVP5Hd
	/S0dTlM0MAKj7C57AtFQekb/5xjGgS3/4DxKar7E=
X-Received: by 2002:ac8:5e07:0:b0:4f1:ea19:da with SMTP id d75a77b69052e-4ffa77a980amr30782131cf.41.1767706539077;
        Tue, 06 Jan 2026 05:35:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPD6m9FEO35cMyxDw/tSQhzPih+ass4GVCRB9Yy1jTQZQsQ6CKO9WSDyemui3d8G12E1P5fQ==
X-Received: by 2002:ac8:5e07:0:b0:4f1:ea19:da with SMTP id d75a77b69052e-4ffa77a980amr30781961cf.41.1767706538634;
        Tue, 06 Jan 2026 05:35:38 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3980:9f91:8651:f23b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm4416845f8f.32.2026.01.06.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:35:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arc: axs10x: drop unneeded dependency on OF_GPIO
Date: Tue,  6 Jan 2026 14:35:34 +0100
Message-ID: <20260106133534.46065-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Uqc0KiNNMgU-P1ascF5eB2phaUUkBHie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOCBTYWx0ZWRfX3UjCjT66IS3z
 TRuimqWdczIJFEshzC93PNWeavuAgNNyS35CAhD7BqPNKe1s4OlAvnXAUsOlAjSexCR25o6YMIc
 Xkab9GmMUqykadF781EXFuxxU+cXJ+0teO63vvCrq+TfWXn2GqpcHg9Vvg5XyErZmoaUsxnO2bv
 kj0wZfpfukF8q2VBznths08r3Js/oRa19t0T+Ykvc+UPLm79lwIixUnHzJbLwfhAyWZqKsLPTeD
 ih/toUNRdkv2GmPAhbR8MMruEOGwxrzz9/phTlcr1apgJ9xJ/+nk/vIkc26MQQ3QZnIyOgf+fXX
 EaMCAlUb1wgJhC5EHwMBQmwnfm+UN8YJOv/n5LsHVdBjpKe1wfi68m4AYrgMJLm+0DG9MoSzmqF
 WTSS8Xs2ILRnm8lsCZNyuiw1nxn/fFKvdTpHSVP/95DDXM//WDVZFo6Bx78NOw3KAMQ2IbqSkya
 HDGzmHar/M7jtadgnmg==
X-Proofpoint-GUID: Uqc0KiNNMgU-P1ascF5eB2phaUUkBHie
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695d0fac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h5iQS2IsQTeOLWWD87gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_053540_973392_5CB06307 
X-CRM114-Status: GOOD (  11.29  )
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

OF_GPIO is automatically enabled on all OF systems. There's no need to
select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arc/plat-axs10x/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfig
index b9652c69d1b9..40f2a74d404a 100644
--- a/arch/arc/plat-axs10x/Kconfig
+++ b/arch/arc/plat-axs10x/Kconfig
@@ -7,7 +7,6 @@ menuconfig ARC_PLAT_AXS10X
 	bool "Synopsys ARC AXS10x Software Development Platforms"
 	select DW_APB_ICTL
 	select GPIO_DWAPB
-	select OF_GPIO
 	select HAVE_PCI
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB
-- 
2.47.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
