Return-Path: <SRS0=TWh9=ZM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D886C432C3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Nov 2019 10:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD8A22311
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Nov 2019 10:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X27n/nZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD8A22311
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aHNidq515dy0f0eEP8JoccZOI2BTir0KS68hDolikiw=; b=X27
	n/nZPzGfL4JLFRunyLWlO4qWSYP0toQVOrYJBY/P7H3Yf1mEYYdV8VK99ODFO0XuMwazFPugJdj/b
	NVL2c3ianZ/tHK0115d1jlIc1mAv+Y3dcRQiA4znb/9kRgxg6f7NlgfwZx5lRS62iqhoqGxwyowzY
	uA6UaR4qFuBWrBroU7TQfKnnjbwhAh+Um3rCAeXst/hQrKUVXsXsGaUbEIONrHHLvTRnKfAr5MfR1
	SUpi3gQyEPvG9tXtMlZembME+cva0nXFZRf5A6c0bEXQOCsIDaT8yEAqC2s6qH4x2uyA2co1/GH+z
	lysNFLDg0uL/Pt5Q3DEhLC5uPwDV5Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXMzn-0001EZ-OT; Wed, 20 Nov 2019 10:13:59 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXMzk-0001DG-RT
 for linux-snps-arc@lists.infradead.org; Wed, 20 Nov 2019 10:13:58 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKABXC9044797
 for <linux-snps-arc@lists.infradead.org>; Wed, 20 Nov 2019 05:13:49 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wbxndnm5h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Wed, 20 Nov 2019 05:13:49 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <noreply@ellerman.id.au>;
 Wed, 20 Nov 2019 10:13:47 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Nov 2019 10:13:46 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKADj2146792780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 10:13:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AEC652052;
 Wed, 20 Nov 2019 10:13:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1AFE75204F;
 Wed, 20 Nov 2019 10:13:45 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 8DE95A0221;
 Wed, 20 Nov 2019 21:13:39 +1100 (AEDT)
Received: from 78c6c811cd18 (ka2.ozlabs.ibm.com [10.61.145.21])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 7C182E00E8;
 Wed, 20 Nov 2019 21:13:40 +1100 (AEDT)
MIME-Version: 1.0
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Wed Nov 20, 21:13
From: noreply@ellerman.id.au
To: Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com,
 linux-snps-arc@lists.infradead.org
Date: Wed, 20 Nov 2019 10:13:40 -0000
X-TM-AS-GCONF: 00
x-cbid: 19112010-0008-0000-0000-000003351E74
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112010-0009-0000-0000-00004A5440DF
Message-Id: <20191120101340.1.97280@78c6c811cd18>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_02:2019-11-15,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=2 phishscore=0 mlxlogscore=583
 clxscore=1034 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911200094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_021356_890344_8F2BD4B1 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Wed Nov 20, 21:13

http://kisskb.ellerman.id.au/kisskb/buildresult/14034891/

Commit:   Add linux-next specific files for 20191120
          1fef9976397fc9b951ee54467eccd65e0c508785
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

Possible errors
---------------

arch/arc/boot/dts/axs10x_mb.dtsi:66.24-71.5: ERROR (phandle_references): /axs10x_mb/pguclk@10080: Reference to non-existent node or label "input_clk"
ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [scripts/Makefile.lib:295: arch/arc/boot/dts/axs101.dtb] Error 2
make[1]: *** [Makefile:1244: dtbs] Error 2
make: *** [Makefile:179: sub-make] Error 2

No warnings found in log.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
