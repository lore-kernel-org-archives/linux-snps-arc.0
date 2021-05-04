Return-Path: <SRS0=zACa=J7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B94DC433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 May 2021 07:40:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97389611C0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 May 2021 07:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97389611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lvgJZEDWBaBYL98OH6/2INNYLzUN76KvNR62vtUaYMs=; b=adt9aPYQCiJBMzy7GIZSoqt3S
	6xP1sij6o2NSAAnPGU19mXfi9zVURRLexagLIBCzGsiHQn3bWZYS/Wxq9uyBvfVbBv1QuGQyVOnRz
	FJWU/P4v4hoH4SglJCTdq1sLzs24R0Cv0nOXtPIF0wEmQ+3gUri9vxPcxbJedxHg7B6rG4BzLJlsk
	jI+5zzSlCBrIxcOtkfyX68t58LLQt5lHOyLOE/uqm74m/Ykm2+lEHIxy1VVzJ6+0RgMc6JMxF0F/o
	GHI3wvi76KOusCri/bcmn4vKoj+518wgYOo5W0ilzvPzIgp+Q6ZolXvPjKUX18RXZ1EjslFSr6aya
	yGIRkYWyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldpfa-00Fd85-M6; Tue, 04 May 2021 07:40:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpfX-00Fd7b-HF
 for linux-snps-arc@desiato.infradead.org; Tue, 04 May 2021 07:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=SNzRA80G7BEoftP4TQQcROGHJxxlHWljovtZ2dqle6M=; b=JGgSnbz12I9YiS/zjZcx55nTkC
 T1SmaUr9tFwktgCyRTivaq17WuWz4JY6NUCbQsAo2Emi+2+D9oHhXV/xtXzc9/bseSx+L/eX0F9GN
 EfBK9zKxkQ1C6Z6z876wyYbvy/tT5/T4+ZIMEplGzX4Y8CU1+U6KcD3trBlxqriDQ9HaXI8uyyXn+
 bQRNU2nQdO3mGHavYFfOQLolAaH35A8bg3IUYeR06eLwTfM/sXjYHhdvNHkAKTLdaqqxSEh77YP6V
 Cb7CWX/0Zu66G7loeCI5aBKIw+fraktroDxAYhxf4R3pn9vRmhT7JqvlTEgJ0IiRXtT1Eib9MZcEn
 IoIA8T/g==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpfU-003lxP-Cc
 for linux-snps-arc@lists.infradead.org; Tue, 04 May 2021 07:40:34 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1447Y8TK073727; Tue, 4 May 2021 03:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=SNzRA80G7BEoftP4TQQcROGHJxxlHWljovtZ2dqle6M=;
 b=VrfZxHOxJy0a7qA1nJsTVskQWqLvq0kcXTsg0caPlHMlfWsUMMXrxBvmsfeIaevXaUa6
 oT8Wk9PKn4dwM5pNRt0jCewGcrC/ut0yk2M2ALJiQL3dGoa4D7V/nu+7weMFhsRipRqB
 GzhiFDOW51PbmbWyWkPC0Q8g/UQBQ5fuhPn217d6oexoCtgA3dfmugMyI5SOwORC/ebW
 itzLKdpLo/3IFtZ6INwLE7Y3bu+QKnDJlI7IZIqYo8lw80swysip031S2PlCNfxxAhXk
 b0zmOlIzEOuJhVN3vE9IYY3gGyRJuqGWLRK232po6k5yy9SHXAAATGAXogvTI9e0+YKQ kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b1wb09kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:39:46 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1447Yca9075458;
 Tue, 4 May 2021 03:39:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b1wb09k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:39:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1447WEC0016838;
 Tue, 4 May 2021 07:39:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 388xm8h27c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 07:39:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1447dGux30474742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 07:39:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A213FAE055;
 Tue,  4 May 2021 07:39:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19DA5AE045;
 Tue,  4 May 2021 07:39:41 +0000 (GMT)
Received: from sig-9-145-90-245.uk.ibm.com (unknown [9.145.90.245])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 07:39:41 +0000 (GMT)
Message-ID: <9e52895227515143bf3cd9197876ff1ed596682b.camel@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] asm-generic/io.h: Silence
 -Wnull-pointer-arithmetic warning on PCI_IOBASE
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@synopsys.com>, "David S. Miller"
 <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, clang-built-linux
 <clang-built-linux@googlegroups.com>, linux-arch
 <linux-arch@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>
Date: Tue, 04 May 2021 09:39:40 +0200
In-Reply-To: <CAK8P3a3mCujxC0=_cL6Z88Xh2cb=OY_Ct7DVpJNvRn1v9=FhkQ@mail.gmail.com>
References: <20210430111641.1911207-1-schnelle@linux.ibm.com>
 <CAK8P3a3mCujxC0=_cL6Z88Xh2cb=OY_Ct7DVpJNvRn1v9=FhkQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Pftu_AEJr1ccZfm4uSBQRSXbzHt5fUN
X-Proofpoint-GUID: NnNsF52RJSWhrfL8DmTT5s-OsatqEN8Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_02:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=880 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105040057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_004032_677902_B4A7DB0B 
X-CRM114-Status: GOOD (  33.95  )
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

On Mon, 2021-05-03 at 18:07 +0200, Arnd Bergmann wrote:
> On Fri, Apr 30, 2021 at 1:16 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > From: Niklas Schnelle <niklas@komani.de>
> > 
> > This is version 4 of my attempt to get rid of a clang
> > -Wnull-pointer-arithmetic warning for the use of PCI_IOBASE in
> > asm-generic/io.h. This was originally found on s390 but should apply to
> > all platforms leaving PCI_IOBASE undefined while making use of the inb()
> > and friends helpers from asm-generic/io.h.
> > 
> > This applies cleanly and was compile tested on top of v5.12 for the
> > previously broken ARC, nds32, h8300 and risc-v architecture
> > 
> > I did boot test this only on x86_64 and s390x the former implements
> > inb() itself while the latter would emit a WARN_ONCE() but no drivers
> > use inb().
> 
> This looks all fine to me, but with the merge window open right now, I
> can't add it into linux-next yet, and it wouldn't qualify as a bugfix for 5.13.
> 
> Please resend them to me after -rc1 is out so I can merge it for
> 5.14 through the asm-generic tree.

Thanks for the great feedback I appreciate it. Will do the resend of
course.

> 
> Please add two small changes to the changelog texts:
> 
> - for patch 3, please include a 'Link: tag' to the lore archive of the
>   previous discussion, that should cover any questions that people
>   may have

Done

> 
> - for the risc-v patch, I would suggest explaining that this fixes
>   an existing runtime bug, not just a compiler error:
>   | This is already broken, as accessing a fixed I/O port number of
>   | an ISA device on NOMMU RISC-V would turn into a NULL pointer
>   | dereference.
>   Feel free to either copy this, or use your own explanation.

I mixed the above in with the current commit message:

    Without MMU support PCI_IOBASE is left undefined because PCI_IO_END is
    VMEMMAP_START. Nevertheless the in*()/out*() helper macros are left
    defined with uses of PCI_IOBASE. At the moment this only compiles
    because asm-generic/io.h defines PCI_IOBASE as 0 if it is undefined and
    so at macro expansion PCI_IOBASE is defined. This leads to compilation
    errors when asm-generic/io.h is changed to leave PCI_IOBASE undefined.
    More importantly it is currently broken at runtime, as accessing a fixed
    I/O port number of an ISA device on NOMMU RISC-V would turn into a NULL
    pointer dereference. Instead only define the in*()/out*() helper macros
    with MMU support and fall back to the asm-generic/io.h helper stubs
    otherwise.



> 
>        Arnd


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
