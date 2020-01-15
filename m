Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF10DC33CB1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 07:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1CB2084D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 07:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mkbZRTi7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1CB2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hW+Rt/RID4lbgdvvp19Bd4eh5BK/4p4LsDtyVy4LhQo=; b=mkb
	ZRTi7xQh/Jy3Lt1RIQAtddbWZZbSb5dNcKaCkDccOENg30MhcYRRWqwGgbbedW+ST/RD3gl+Ya9am
	X1qLLSnqhMopJ9Ys2CUNvfB8ifA8B8xb8TQRIt4/Wl5ZwIjLghZPvWbyZNKFl+DoixqtadY8n17PV
	XGt5G+7yPRzX1DSDqoM+Gt0MNRBv9xnb74LpQi4qqLwYLqV5Lc0eC8t5J4WSj6RIu895d0Rg+tbGl
	+S5KZIO/EDRb8q4IHbk7WtO3BZcG59K5Nypaj+qvYk3ElKXK2XlW8bKUI8U4Nz6BnXrbIpXAYPHMN
	VfAPE1Q36tEkWDrYh87m+GYm3u8Y2Rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ircnk-0004Ku-QQ; Wed, 15 Jan 2020 07:09:16 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ircnh-0004KM-Kz
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 07:09:14 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00F77hIM100447
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 02:09:13 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvq7c1qh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 02:09:13 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <noreply@ellerman.id.au>;
 Wed, 15 Jan 2020 07:09:11 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 Jan 2020 07:09:08 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00F797hB44106226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 07:09:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B25BDAE055;
 Wed, 15 Jan 2020 07:09:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F3F7AE04D;
 Wed, 15 Jan 2020 07:09:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jan 2020 07:09:07 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id BBF6DA00F2;
 Wed, 15 Jan 2020 18:09:03 +1100 (AEDT)
Received: from 03820ad8799d (ka2.ozlabs.ibm.com [10.61.145.21])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 4754FE00E9;
 Wed, 15 Jan 2020 18:09:06 +1100 (AEDT)
MIME-Version: 1.0
Subject: kisskb: OK linus/axs101_defconfig/arcompact Wed Jan 15, 18:07
From: noreply@ellerman.id.au
To: Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com,
 linux-snps-arc@lists.infradead.org
Date: Wed, 15 Jan 2020 07:09:06 -0000
X-TM-AS-GCONF: 00
x-cbid: 20011507-0028-0000-0000-000003D12E3B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011507-0029-0000-0000-000024955218
Message-Id: <20200115070906.1.32649@03820ad8799d>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_06:2020-01-14,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 clxscore=1034 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=2 mlxlogscore=503
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_230913_691864_B3A73A70 
X-CRM114-Status: GOOD (  11.78  )
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

OK linus/axs101_defconfig/arcompact Wed Jan 15, 18:07

http://kisskb.ellerman.id.au/kisskb/buildresult/14095390/

Commit:   Merge branch 'dhowells' (patches from DavidH)
          e033e7d4a8081852b2cca53e530e2c0f4e6769c0
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (2)
----------------------

<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
net/ipv4/tcp_input.c:4389:49: warning: array subscript is above array bounds [-Warray-bounds]


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
