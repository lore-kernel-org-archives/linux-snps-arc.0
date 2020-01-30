Return-Path: <SRS0=jCxm=3T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC2EC33C9E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Jan 2020 07:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 519422083E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Jan 2020 07:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bk1bERRA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 519422083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjxnKnR+sXr6NqezCBaSk7supT3JIxFWtLNmYMWdMoM=; b=Bk1bERRAUjnJ4y
	f3ML/NLaU/2mWjVxw30IqH8UHjxJYWEpUDVFDxtC2njXDrjT8mOHaU77DK0Qo3eErsfPRhe1IJf3w
	nMyw3SQGExlebBcAQKa0LDXik6WZBZAcUhuaKfjc71ErMIaKTRqhWhxsgZlomg6CdDNISFOej0AnI
	5dwr9KRfp92rGTWlBzYsrleL1uKeHw/XUZpl4XOrwEHWPlbQJ3lvrmhp17gdUN4Pxu/ZFQDmRcG3t
	urnS9RXz2jyjhqv9SSU0zzxmVouqtEtbodq4MrygSvCSLrfC2SGVUeYoRvOp14dw5N3xINCMo1zsN
	riF22jHOitVTKKRo/2Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ix4FD-0001fm-1i; Thu, 30 Jan 2020 07:28:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix4F9-0001eO-VB
 for linux-snps-arc@lists.infradead.org; Thu, 30 Jan 2020 07:28:05 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00U7O37G024295
 for <linux-snps-arc@lists.infradead.org>; Thu, 30 Jan 2020 02:28:01 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xu5qbxsgq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Thu, 30 Jan 2020 02:28:00 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <rppt@linux.ibm.com>;
 Thu, 30 Jan 2020 07:27:57 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 Jan 2020 07:27:47 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00U7Rk2i44564690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 07:27:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD406AE051;
 Thu, 30 Jan 2020 07:27:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C847AE04D;
 Thu, 30 Jan 2020 07:27:43 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.154])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Jan 2020 07:27:43 +0000 (GMT)
Date: Thu, 30 Jan 2020 09:27:41 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
 <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
 <20200129232044.2d133d98@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129232044.2d133d98@thinkpad>
X-TM-AS-GCONF: 00
x-cbid: 20013007-0008-0000-0000-0000034DFF2E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20013007-0009-0000-0000-00004A6E7E76
Message-Id: <20200130072741.GA23707@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_01:2020-01-28,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=56 priorityscore=1501
 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_232804_472267_3CB67FAE 
X-CRM114-Status: GOOD (  18.52  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 29, 2020 at 11:20:44PM +0100, Gerald Schaefer wrote:
> On Mon, 27 Jan 2020 22:33:08 -0500
> 
> For example, who would have thought that pXd_bad() is supposed to
> report large entries as bad? It's not really documented anywhere,

A bit off-topic,

@Anshuman, maybe you could start a Documentation/ patch that describes at
least some of the pXd_whaterver()?
Or that would be too much to ask? ;-)

> so we just checked them for sanity like normal entries, which
> apparently worked fine so far, but for how long?

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
