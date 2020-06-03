Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30AEC433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 06:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732792072F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 06:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQ+0FdbU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732792072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVaeFBXDWzEk1zvxzuw/ltJVTeaGEjczKSl68fcTF+g=; b=nQ+0FdbUbR1IhV
	zM9HqUrmdYQwbRh3OsI/OMMbf1ew+C2KJclnF30kR4IPo7EvJumKdJOUoCi9HmHEFxhn5wNiqpay0
	0lWMIgqTmgUFOZr/lhtpn3KOyq7LYbYGF75Fo+uJRKf4fbRyB/E9cBHq5uYJj9alWvKrzk3q2WOBJ
	7I9CSvqUozNIHh3W0yeirgsLQZOOhUEUtVFKuRF7VJnK0J9FgJCvmP2J9QSe9hT+YDQ8OMLatOzvb
	u/VqXm4VYs57lW2Jt4+SR4SnEVmmoIMZ/7o4PN+jaqO217XmQo4WIq3zZSWdU3FhvSvMVqlUqRwmU
	x5JpEEPLBCpgknEEfXgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgMtl-0001Kv-L9; Wed, 03 Jun 2020 06:29:13 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgMtg-0001KA-Tw
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 06:29:12 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053628nC014556; Wed, 3 Jun 2020 02:29:06 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31e3rhv5bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 02:29:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0536GOAa005586;
 Wed, 3 Jun 2020 06:29:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf47yekc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 06:29:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0536T21C64160086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 06:29:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8575CA4040;
 Wed,  3 Jun 2020 06:29:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 539AAA4051;
 Wed,  3 Jun 2020 06:29:02 +0000 (GMT)
Received: from oc4452167425.ibm.com (unknown [9.145.12.61])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jun 2020 06:29:02 +0000 (GMT)
Subject: Re: [PATCH v2 2/4] iee754: provide gcc builtins based generic fma
 functions
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-3-vgupta@synopsys.com>
 <34fc6c13-65e6-dcbb-42b1-1ba9f56b4dfd@linux.ibm.com>
 <c9bc348f-0441-2f0c-7336-b541f7d1e6f9@synopsys.com>
From: Stefan Liebler <stli@linux.ibm.com>
Message-ID: <d2af88d7-6ae5-013a-4b00-4458e788a38d@linux.ibm.com>
Date: Wed, 3 Jun 2020 08:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c9bc348f-0441-2f0c-7336-b541f7d1e6f9@synopsys.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_03:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 cotscore=-2147483648 adultscore=0
 mlxscore=0 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_232909_912699_4E4E1306 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/2/20 7:13 PM, Vineet Gupta wrote:
> On 6/2/20 5:51 AM, Stefan Liebler via Libc-alpha wrote:
>>  #endif /* math-use-builtins.h */
>> Please also update the current architecture specific math-use-builtins.h
>> file: sysdeps/s390/fpu/math-use-builtins.h
>> Otherwise it will break build on s390x.
> 
> Done.
> 
>>> diff --git a/sysdeps/ieee754/dbl-64/s_fma.c b/sysdeps/ieee754/dbl-64/s_fma.c
>>> index 876df6e78bdc..9dc5b132b9ee 100644
>>> --- a/sysdeps/ieee754/dbl-64/s_fma.c
>>> +++ b/sysdeps/ieee754/dbl-64/s_fma.c
>>> @@ -25,6 +25,7 @@
>>>  #include <fenv_private.h>
>>>  #include <libm-alias-double.h>
>>>  #include <tininess.h>
>>> +#include <math-use-builtins.h>
>>>
>>>  /* This implementation uses rounding to odd to avoid problems with
>>>     double rounding.  See a paper by Boldo and Melquiond:
>>> @@ -33,6 +34,10 @@
>>>  double
>>>  __fma (double x, double y, double z)
>>>  {
>>> +#if USE_FMA_BUILTIN
>>> +  return __builtin_fma (x, y, z);
>>
>> Architectures which have support for ldbl-128 will use the file
>> sysdeps/ieee754/ldbl-128/s_fma.c instead of
>> sysdeps/ieee754/dbl-64/s_fma.c. Should this file also be adjusted in
>> order to use the builtin if USE_FMA_BUILTIN is set to one?
> 
> Right.
> 
> I used commit f82996f815 "Use GCC builtins for round functions if desired" as
> starting point for my change. And seems it was not an ideal reference :-) as round
> has far fewer instances than fma. Indeed fma is present in ldbl-128 and dbl-64 so
> needs updating in both.
> 
> But just to be sure s390 is currently not using the newly introduced builtins so
> I'll keep them as follows.
> 
> #define USE_SQRT_BUILTIN 0
> #define USE_SQRTF_BUILTIN 0
> 
> #define USE_FMA_BUILTIN 0
> #define USE_FMAF_BUILTIN 0
> #define USE_FMAL_BUILTIN 0
> #define USE_FMAF128_BUILTIN 0
> 
Yes. Those should be disabled for now in order to not break anything. As
soon as you've committed your patches, I'll have a look if I can
activate some of them and remove s390 specific implementations. But I
first have to check with the gcc guys, if the builtins are always
expanded correctly in various gcc versions.

Thanks.
Stefan
> -Vineet
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
