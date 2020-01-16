Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CA0C33CAF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 04:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B0B2075B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 04:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfL5q86y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B0B2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Gn8uIKmAwqTjAxUjUb+CmU2f/Gv+TERY5+D20eOp3xw=; b=lfL
	5q86yQ68namLY53eo7I1L71swWY7o0lLxZGOTUFAJwT77ErkrqptGKtP9v+TU181m2JCucXze+Mlj
	9rZz+PUf/wqzBlT8KMpMDbz2/JBFEy2JF/36/UMx0wswMmdwoga1lFWb9KsXzXJxoodz75f5OqP4O
	BPFq7VzowfHZJD2fPhQhdoPPveOqcLDmiSPmMOcVmo/YlWP+HvZR8pQ3g9iVJQc8XhKyABji53LAE
	TpM61dFbeCJriDwprOcGB682mGSMC07qLONFJAAvSpVVZ6rNOJs5Yh0vHzs2B4j94tXtrB1WkrmIL
	CJ1M1HFeGTONoDguUq8Ek2AorXBtxsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irwsA-0000CT-Da; Thu, 16 Jan 2020 04:35:10 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irws5-0007xv-II
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 04:35:08 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00G4W0PA075995
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 23:35:04 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhy3vkgkt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 23:35:04 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <noreply@ellerman.id.au>;
 Thu, 16 Jan 2020 04:35:02 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Jan 2020 04:35:00 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00G4YxHS59965592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 04:34:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94F4B52052;
 Thu, 16 Jan 2020 04:34:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4B7575204F;
 Thu, 16 Jan 2020 04:34:59 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 5FECEA01AC;
 Thu, 16 Jan 2020 15:34:55 +1100 (AEDT)
Received: from 03820ad8799d (ka2.ozlabs.ibm.com [10.61.145.21])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id E0AECE00E9;
 Thu, 16 Jan 2020 15:34:57 +1100 (AEDT)
MIME-Version: 1.0
Subject: kisskb: OK linus/axs101_defconfig/arcompact Thu Jan 16, 15:33
From: noreply@ellerman.id.au
To: Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com,
 linux-snps-arc@lists.infradead.org
Date: Thu, 16 Jan 2020 04:34:57 -0000
X-TM-AS-GCONF: 00
x-cbid: 20011604-0016-0000-0000-000002DDB9EA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011604-0017-0000-0000-000033404FD3
Message-Id: <20200116043457.1.93245@03820ad8799d>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_02:2020-01-16,
 2020-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 clxscore=1034
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=636
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_203505_620640_A79F32F1 
X-CRM114-Status: GOOD (  10.87  )
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

OK linus/axs101_defconfig/arcompact Thu Jan 16, 15:33

http://kisskb.ellerman.id.au/kisskb/buildresult/14097372/

Commit:   Merge tag 'platform-drivers-x86-v5.5-3' of git://git.infradead.org/linux-platform-drivers-x86
          51d69817519f5f00041a1a039277f0367d76c82c
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
