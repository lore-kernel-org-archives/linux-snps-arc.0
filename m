Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B46C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:50:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C247613F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C247613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KnFnG889MtLHkO1fRlIWVTwv7hlJK5wSxfeCu+wbH1o=; b=W/cDkq32XJgUCVl3MGNuHyXkT
	U74MrAocEiVqH1JBjhgvGUoTc+Yron8nOyOT79Q6okZ0sn4t/3hajvPEtXw/SfWTlpojw8rF5d9yX
	KAEYK+LXAxnKZXq+42bgYSv55pTmhCXvoznXJQjmvRAFP2uw8Dnpb6fIM7vlDZu6v6obsoihrO0Mv
	plX3hx0fedRPMj6ONpqtmgNq7PQvK8ZpPxOzjyToy3Sfcru77goP1tzKCZKjv+fOPF+JD84CzRe4C
	Ba91GpZUtQl4Z6lKweciXwGzzRM2N6C/J/d2UgEsbDwz4mV24njMTwuKlJM4FvYxzbnMjBoVhIaYn
	dleMy47Ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZBNY-00EKhK-Fd; Wed, 21 Apr 2021 11:50:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZBNV-00EKgp-67
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 11:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=umFa+41AGn1p0ze7VTHK1gWh/RUXya1ijTfV9QCSiUU=; b=apSp63mXCuY+VIb6rlcSb0sXZ5
 7iQUYhgXAjVLtGHw05Zj6eZeXM97ePMp5xTlpWAauFDAi6JblfGPHBzzbtC/daF2IZzJuhRtg4+9L
 QEd4zSqcVA0BuDyiHez3rH3hQgTWdDtIJlDLIUThfwhsiUR2CD4ymS0GAKHA5Y2COhcwPX7M0NFzD
 iAV591Z8UdvzzOg36m/1DmJfEByX451S38e6cQ403T4hBuqFnHo0Zg4FbL1UzSc9XXMATT3pfwyR7
 IkofG4RIrakOcUxmsDZ0yhRpsj6fohIRbeWKhbt6GmO1zyHkf+shNBv4F8Aji4KWzTtfa61yGrbnp
 DwVzY1nw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZBNP-00CqYg-On
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 11:50:43 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LBiPCm166756; Wed, 21 Apr 2021 07:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=umFa+41AGn1p0ze7VTHK1gWh/RUXya1ijTfV9QCSiUU=;
 b=Fg+gjzmIsdkWN2gD6MQFOMUskRgAI7wvOomoXc8tUZ232jGOusYCK0QAesykWFWy9Px6
 ja+v1kP9wThdS6Y7FD47R54K2iePD5jO3sQGfqnGYdqKdw6ALR2mI2lFNFDBi3D/T0pO
 RCJCZ5CPx8nNJfArsvLON/EX3Cy8DJ0r2xys6WbOMY3h8RYC86A14oiYCGNU6/nRJuTg
 Cm73iFvSvU9QmRqcGTiAUOCNCIw58NCMa5ReNI30kzL8Rn78gDZSpMszjGoQ03og70Yv
 VuuqUuFe196UkXTFFvapgJpOKypKFeBrtGoqk4eGKyPVrXPv9wH4iKJrM7lDqd67ZDF/ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382keg84vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:50:31 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LBjTo5173888;
 Wed, 21 Apr 2021 07:50:31 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382keg84v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:50:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LBmOZW023128;
 Wed, 21 Apr 2021 11:50:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37yqa8j915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 11:50:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13LBo3t334406874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 11:50:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D0CC4C044;
 Wed, 21 Apr 2021 11:50:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D968D4C04A;
 Wed, 21 Apr 2021 11:50:25 +0000 (GMT)
Received: from sig-9-145-20-41.uk.ibm.com (unknown [9.145.20.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 11:50:25 +0000 (GMT)
Message-ID: <aac9ac52de09ff7162fc7caa6e817258d9dd313d.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/3] asm-generic/io.h: Silence
 -Wnull-pointer-arithmetic warning on PCI_IOBASE
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@synopsys.com>, "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, "clang-built-linux@googlegroups.com"
 <clang-built-linux@googlegroups.com>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "sparclinux@vger.kernel.org"
 <sparclinux@vger.kernel.org>
Date: Wed, 21 Apr 2021 13:50:25 +0200
In-Reply-To: <bb21141706d7477794453f7f52f6bc98@AcuMS.aculab.com>
References: <20210421111759.2059976-1-schnelle@linux.ibm.com>
 <20210421111759.2059976-4-schnelle@linux.ibm.com>
 <bb21141706d7477794453f7f52f6bc98@AcuMS.aculab.com>
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GljSLrlc0NXVaepFAyeRF6XnrO1FeM8W
X-Proofpoint-ORIG-GUID: 50MlIDyyzltO3bQ54AWDJNeVxVPQ8cF6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_04:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104210090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_045040_059181_5C333F3B 
X-CRM114-Status: GOOD (  29.65  )
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

On Wed, 2021-04-21 at 11:24 +0000, David Laight wrote:
> From: Niklas Schnelle
> > Sent: 21 April 2021 12:18
> > 
> > When PCI_IOBASE is not defined, it is set to 0 such that it is ignored
> > in calls to the readX/writeX primitives. This triggers clang's
> > -Wnull-pointer-arithmetic warning and will result in illegal accesses on
> > platforms that do not support I/O ports if drivers do still attempt to
> > access them.
> > 
> > Make things explicit and silence the warning by letting inb() and
> > friends fail with WARN_ONCE() and a 0xff... return in case PCI_IOBASE is
> > not defined.
> ...
> > diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> > index c6af40ce03be..aabb0a8186ee 100644
> > --- a/include/asm-generic/io.h
> > +++ b/include/asm-generic/io.h
> ...
> > @@ -458,12 +454,17 @@ static inline void writesq(volatile void __iomem *addr, const void *buffer,
> >  #define _inb _inb
> >  static inline u8 _inb(unsigned long addr)
> >  {
> > +#ifdef PCI_IOBASE
> >  	u8 val;
> > 
> >  	__io_pbr();
> >  	val = __raw_readb(PCI_IOBASE + addr);
> >  	__io_par(val);
> >  	return val;
> > +#else
> > +	WARN_ONCE(1, "No I/O port support\n");
> > +	return ~0;
> > +#endif
> >  }
> >  #endif
> 
> I suspect that this might be better not inlined
> when PCI_IOBASE is undefined.
> 
> Otherwise you get quite a lot of bloat from all the
> WARN_ONCE() calls.
> 
> 	David

Hmm, I was wondering if we should rather have a large ifdef block of
all these functions stubbed to WARN_ONCE rather than in each function.
As I understand it this would be necessary if we want the inline gone.
They would still be static though so we still get a copy per
compilation unit that uses it or am I misunderstanding?

> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
