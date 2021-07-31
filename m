Return-Path: <SRS0=+3F3=MX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E638EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Jul 2021 06:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E8660F12
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Jul 2021 06:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7E8660F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxTNdgeqLrc2GxauEWWa75J0GgyVc/f6p8cfQz6ywaE=; b=LAYnY/HzCz2FNf
	gYjqG8iuDgIMmAqKjiETtL5X4ZXL4AOlQ/IFncO+0XaFqC0/fbtCQh5A3KvJfS/iAe1IBQnP5qhhD
	nhlYUiUFntALdlFlDRGiA9NeMY/giRL3zaA6QedIDrAZKxqzFJ24QTb4ty/CM7/hFK5/GiBk4OUjx
	U9o2+lQTFtN+eDEYiB4XX7fGaZ96ESLTnthAcEiHn6VEzMV4m2l4AKr3h2+nuNcE0xRJDlF8oxnKn
	5GgJ9drEkwm2axoCHSEpTpdqkNpkSlYm3uNUTK06fFkL6MBI6EHjnb9MMUCtvq0lPU/qvOwuScia4
	AaYltNzDKUxhNRgoSLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9ipu-00B5bR-5Z; Sat, 31 Jul 2021 06:51:06 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9ipr-00B5aj-LS; Sat, 31 Jul 2021 06:51:04 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16V6XQmG085951; Sat, 31 Jul 2021 02:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=AykrfsFgkMAYLNg2w36lRGIX3leux4UCoOOR3djqTLk=;
 b=hfejmFW+fXsOsLjD+mu8ZUTBnuS4CofZfnheKQKaT8a2RLuIIciO8wwpdydUxCYZzqls
 YavwCO3kmcbYvdwtIYcHCK4z/HQ+JEMl27G6d0fQtKPQ19/I8LfIPC4tqRtknJAZijrA
 EtZov9BGRDi1hH8vhvca0WInmSLH840nS0EuvlDPSn9pAPdeJr8o6eJRK+cdfU6JVfQ8
 QjAPDcmiTyhI5FB9XJ+2Pv5G2sbhuG3VOtmyVEbQbO8iaDci110hYw94PoZGVctBsyvJ
 haC/x/MvVLXh5ldbSUHSC+JOMCOyj6GkIFI14qhLTYhpjpd6+iIm+gfUhzF9t0pbvGT1 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a4w54n690-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Jul 2021 02:50:11 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16V6kaAg127005;
 Sat, 31 Jul 2021 02:50:10 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a4w54n687-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Jul 2021 02:50:10 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16V6h3V6005513;
 Sat, 31 Jul 2021 06:50:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x58r77c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Jul 2021 06:50:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16V6o4AF27656602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 31 Jul 2021 06:50:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D728211C04A;
 Sat, 31 Jul 2021 06:50:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F35A11C050;
 Sat, 31 Jul 2021 06:50:01 +0000 (GMT)
Received: from osiris (unknown [9.145.16.160])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 31 Jul 2021 06:50:01 +0000 (GMT)
Date: Sat, 31 Jul 2021 08:50:00 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Linus Walleij <linus.walleij@linaro.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Nick Hu <nickhu@andestech.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mike Rapoport <rppt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-riscv@lists.infradead.org, YiFei Zhu <yifeifz2@illinois.edu>,
 Greentime Hu <green.hu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rich Felker <dalias@libc.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-um@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brian Cain <bcain@codeaurora.org>, linux-csky@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Chris Zankel <chris@zankel.net>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-parisc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Colin Ian King <colin.king@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Mark Rutland <mark.rutland@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 openrisc@lists.librecores.org
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Message-ID: <YQTymISw2nXxDSGu@osiris>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b8JyszSZHwxzYkonaS857HhsIawmofS_
X-Proofpoint-GUID: vxXdXbz5r_bOe1aK5v2-uA7MeMo7WGZw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_11:2021-07-30,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=567 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107310029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_235103_741314_2DC4FD51 
X-CRM114-Status: GOOD (  18.38  )
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

On Sat, Jul 31, 2021 at 02:22:32PM +0900, Masahiro Yamada wrote:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
...
>  arch/s390/Kconfig             | 1 +
>  arch/s390/Kconfig.debug       | 3 ---

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
