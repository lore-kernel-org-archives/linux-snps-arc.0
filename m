Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BD8E937F2
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2026 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zkdMGGL0MNIVb0SCcgxvJE0w6TaOjzqiA0HXG9Ai3Uk=; b=yjNDGrqQ93IyU0
	5DtrM3tdFXvDvas4mjqd7LFwV2/0Z6XZlqYFA9DWTiehX/w4zuTT8eWsBqPpYOR54N7BxH8T9haDf
	pQGicidUYwQ7vBZt21u+GGtAMM931UXsjdZPEA8iXK17vhVPBcgPwZMmv2tU7y0pD7Ib2cpL2t03t
	HwwTR242DMJg8JGgFMopnMJgobZdeWIYdGWWoNAODz5LhF4AgELdzZc3vyiJVdYhtEXDngkQP5bGR
	u/DmiWjVFtdlV8n/RQMBlwLho5VSqwpK69PR+tUCugiyem9ZZIu6MmCmgxbLJOe3jbzvCv8/NEkJ0
	w8eoCqD+pMGloP5tKGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByLE-0000000EWLR-32Yy;
	Sun, 12 Apr 2026 17:11:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByLA-0000000EWKw-01CL
	for linux-snps-arc@lists.infradead.org;
	Sun, 12 Apr 2026 17:11:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE52jZ1635204
	for <linux-snps-arc@lists.infradead.org>; Sun, 12 Apr 2026 17:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Od9vc3Rv7PAed6QWv5NG+lGhYH71uQtRbwq
	H/yjZO04=; b=V2fSz7hJwXrcs1fWy49YdZVpGblGsEDclDtv9NMXj7IKnTq3vgf
	DwdvPcur0iouZvqeQQVUOGZzhnTCuAIGhi6OnxuUMeDwdWTUa2EyWr2YxMR020xv
	e6Aa4bZyOh0ZuIEFAU2Jpw9y6EMdVIqgLTXY5C5iaVpuMPSkhfuX6wxFHx5HcX13
	hNoGJWu2tzOhZbyJRxpQXJ12+WBaZm+DBDxCMBYptVzquPDwvZnrhO3DD6sQdFsW
	A6s9wMYG6lCU0pzCxGgw+67JSBY7h/jeDclLbtDsAIUA8SCmVr1Q4vdVKHeKph5p
	9z3xvbGdr29lm0E+KqIzRfNCZAbSyWYq1Cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6jpgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Sun, 12 Apr 2026 17:11:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d831e8083so45493791cf.3
        for <linux-snps-arc@lists.infradead.org>; Sun, 12 Apr 2026 10:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013878; x=1776618678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Od9vc3Rv7PAed6QWv5NG+lGhYH71uQtRbwqH/yjZO04=;
        b=eiz3WFczlVaHX4fMGqng0mqawcQgS3zGWJs/b0fuEd8gE0XY9SpuuSw8XxarnMi8He
         /DcnqI7NL+b/humlZgL7+ooHE1pNfMYevkKXwgi/bJLyz6EvS1tsHpbuHh45+z0QmUno
         YRHjuWMDNFiNB2hi7/pLWyF3NZXp8uGl6ju5us3mOERP9e4jP0PcWJilQ/c3rkW0rmZE
         BGBRvcvNT9OMWn1wdiXud6Bo1JCaLCPAjsw2VpJ9rbOGIwU+4VJU/GaNV2jjQei0Zrn8
         BsmPO2cO6MZUF7s4KvY6WiHbo1VwfpdVgi3UDaruHcsV5jm32W4YqJMtNO/NJoQLJazs
         XsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013878; x=1776618678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od9vc3Rv7PAed6QWv5NG+lGhYH71uQtRbwqH/yjZO04=;
        b=UKL2/beA/n3Sgi/1d9yFwI7VJ41wAvSTYF1YF+6ciyURFrnpawfIoQjYe2JYEj+3kD
         N708J+EGrjivuJa/PEzB8Ku3oNSpYvxGlvSE9VvBMTeZKBUT3ExAR8EFx1rKCXdxKlbb
         Mcm5+jdzOWbwzpyWg8G1KcEFsOpEDuTCeF1++mGpi2XbJjhOq+tHnMTuF/vsNb9Z8H5u
         Vj2cbumFSjsAZS3TNkodiK4QWC9tmvzCmV6n9RbICne3fGF2MUD3pg6ECfqCjC/URg2u
         VwEZuPXiWSi1ycBSQKXkPD4DD3L+OPFR+WB6738JoRuUbrMYaHutiSQsHpVyf5ttRr/F
         ZmHw==
X-Forwarded-Encrypted: i=1; AJvYcCW8at8epjCDPKvR+z7M++3mZKmRljKrxHCSkA9Wz4bkZONFWAsa55l3niW+DWy9Ym0G4BEKlEFsXr0YXJIkGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSLyYb5SZe+iHSJk04vAnxwPMtyd5azUDD9UW9Ich1gN81ISNr
	0vCYEYemKu/EmuxxCNeWbE2a4Ybcm4cddDgTKKXYxiRb//hmdZmr7S7Q160wHogIrAIetI3aYSz
	j+dJozOxR1CxIEiPrXqGq5RmzrkjjbvTrKPhD1TWpPODeGv+KEYA+p7oKVtIk2byt5qiHFh026s
	I=
X-Gm-Gg: AeBDievyx1C3SdbxhGCCaDcKcDiBOdP6p+7vtfZy/mKdvs1ExN6veIHYmuUm3p4jcok
	yRb8jHfWD0MvlQShvkoZ/axa/rFbbIBMkpFnFMx/nZIc/UCwF24FNWInAT46EcMbvZeTqajafwu
	nB27zc9KJi1T8Jr7/IVbin51cSGnes6/KjkBEW1ypHci3Gf10DyOnWTCZUXuJXdPywHdi/zzM/B
	mDBX517gzj8kgx0YWR/0sFiki7fmuQXsMNRVSLviXUZ6QnX6DEhjevmDCZqKePhrDs/dHAmf9na
	YY4rwqrIzG2krdV+nz848cFLeJeTY6JzkgSEIL+kpZzAdBFjoZbkDhzMasoto5NjP10N7g9grVz
	xZqbU5g/LKcXkzmJOd6OYtfj1mZV3PBVx4EfV
X-Received: by 2002:a05:622a:49:b0:509:3957:48bb with SMTP id d75a77b69052e-50dd5c43e01mr166831051cf.56.1776013878331;
        Sun, 12 Apr 2026 10:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:509:3957:48bb with SMTP id d75a77b69052e-50dd5c43e01mr166830701cf.56.1776013877834;
        Sun, 12 Apr 2026 10:11:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592d606sm229006525e9.9.2026.04.12.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:11:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARC: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
Date: Sun, 12 Apr 2026 19:11:11 +0200
Message-ID: <20260412171110.630639-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=GCFa3rZK7tBA5rCTztLSE9V5e10yzCOD1R6YPR4Q31A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29IueTtlCN+tcDyM2XFL0DY70+Mibi9OBtifT
 FGbZ7lhlbCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSLgAKCRDBN2bmhouD
 17+FD/wJT2bmJKZuysgayJwMnfhPaG3x5k3l8UnuljK0+hlA4b05fcnGjnXGRNgoKCg6oSZZ91J
 SOMNR5ZBJjaG9x5ajXKYwGR8iRNow5Aob3cNaL/5wEXL1ba5ZPRWsvLQ/XCEj9rLit8dWixo13G
 KGaaLJyRlsGSdT3ALvU8Ux/lPxRMMVF4QjUk0OHBU6QsAE8x54TZ1U5KZN0CJLfcCL0LRhFYdF9
 WWMzM2p2/PvvJs4HM/B+79o8Fbtv3+nVnhKhLk0WOMeeaGmSIOCqeinvP2pYgki9NKJNBWalRQs
 lM0byg28PAiWa7nx84mMY5FkPvq8hydNFeoNxEtDiQAYljNOCoHlG2SzTjnVnxT2Zw9T+OiKk03
 BMjx8AjbcctmbjyMzcr9CeQZ+LgUPrZWr2F1GJPPkAG5qBgwmiWd1hxryRTIHRKpk7jkK835uv5
 HWgosWkXtCRwdVxiWg0yRpdeW0hTeDDb0orVGkbMnV9vPw4nGsd1zRdmb0rUkSTtHTAtFR6mR7K
 Ck372HWMfkkJpQXGi1l79C43n9JxDxjmxLSpuV4LjK1pZ8+z6qvFsjkPxiVcPZzQz7g71ui09HL
 dH2gNd9KwuVjYTuxlaLOFib3nsuyLTuHA2AP/zI1W1fmYr+ofWCWlpufd7+W9WtRgC81lZjiAAX hf5hZlnRv1JiicQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfXwXGCqS412PMl
 mhq71tk1jubT8I1kUww8jlGNrhyCg4EZr/uEgNFvXmCCQRmYMd5sOF27yJYwQHsuZlYCceJ/dP+
 eX4FmZsQinnawx42gV5ozc516NQb2vEI0DKaq2XMLV/HiLO/K/soo1BP3YAJGJOM9djHD+m1h4G
 q018xPteEBR3g3ABK0D5G7D2gwc0cE/Kdh/agaIM7GhGpaPMc6gg8AyUSK9xXIb3PYDdBSseAYb
 2EX9oeYZp5E+tVXaA5O6x6HwmskZGemj/qycds3vuI2WTOekz3bn0OkoArwrPKrZ+ckXd1a5ug/
 eyj5tHuKsM2/N8JNvs5s01ND+YcPoLr5rKCT9Eo3LtNNU9o4376m+XEe2NcqWWJFOYpPmxAx7G9
 IfAVlUkGJSoYN/FGU36JSh5buYmdg76vphMaoaAAWGqR8wr2KxLHh+bqtkFDv3PcHTcPkoQr3eX
 SBJg4oTixt0gtELDH2g==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dbd237 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NPZjrCUcZ0bDlzM2A24A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FaEZgJQwbtvggTevrVg4CsqS9mdMYAFC
X-Proofpoint-ORIG-GUID: FaEZgJQwbtvggTevrVg4CsqS9mdMYAFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101120_046761_EE997BF6 
X-CRM114-Status: GOOD (  10.61  )
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

I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
enabled.  No impact on include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arc/configs/axs101_defconfig     | 1 -
 arch/arc/configs/axs103_defconfig     | 1 -
 arch/arc/configs/axs103_smp_defconfig | 1 -
 arch/arc/configs/tb10x_defconfig      | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index f930396d9dae..870e5291b7db 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -67,7 +67,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
 CONFIG_DRM_I2C_ADV7511=m
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 6b779dee5ea0..d45e4d335998 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -67,7 +67,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index a89b50d5369d..f986c0205f13 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -67,7 +67,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
 CONFIG_DRM_I2C_ADV7511=m
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 865fbc19ef03..6e396a9ddb8b 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -61,7 +61,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
-- 
2.51.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
