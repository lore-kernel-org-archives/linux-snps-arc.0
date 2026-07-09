Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EF2C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8u6GxSzJWJBrXmH0zvnX+NZZIitAN9fYsi9uWcP2gw=; b=pW5yOwir+YSkq+
	czg0lpTy2SgfVDRbvSNTOf8+9eNOVHMROsvLJHF/BOEyqceE/RbW2jqj+C/1ozKh6i3Z72vRfQkgp
	5f+9cYDkiPnUwwgIUw0OIBPtAcQUIcB5blQT9gfmDMJ6iIx7Crs1DIk/KiFW93N8ld0vTZ6YV9UNg
	Gb579+x8y+RcLecTs6kj+GzYC7Il2F7/f3BlnS/DDOp15Nq34yYj2k4shJL2LrwA77VIsa1Vs2NlN
	0PNxuajymo/MCGAaeTvXwljTuXsWLNPG3whoEEF2OJbpO3Y7Qg5XRfxzeQgLkrTIy+UM9UHQRzzPT
	8e0p0eUsSqsZgw+IUPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmoG-000000028o2-25pB;
	Thu, 09 Jul 2026 11:20:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmoD-000000028lH-2k4m
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxuSt1614867
	for <linux-snps-arc@lists.infradead.org>; Thu, 9 Jul 2026 11:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=; b=iOWfjmK8f8Y+DVJW
	EcnBVbRqoFetWpR+MvbIm0rNsCYEYiCVdv/jb+r7ZZuAst5pdACVTyVPX1hk4M4R
	UloW32yrnx0br0O0OZPBTsUXsGcPSz6fo0b7Z9SsSAlawkneGV3knPcGuKS4ecbQ
	qUgL7kJ1kZwezKuA1OHch6fG0wR/9IjoD0gaRXopgi656DtKQN7lmNG5nDcMpELo
	+2tydKrnvkk1mYPsPWN5nD/hRUDpTxejd9pRgo55t5XyFzKGEVSWfHJeObs1qXCX
	o+wuU7kKSC/wnWW5kZ8U0x7Pvu4fl9GPrm5rLmSBf6RmcKnNqHf8RgkEBJ09ZjsD
	t7y3cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6ke5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:20:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so20351841cf.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596048; x=1784200848; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=h7QJriVZuTgvOrv07H1eaxDeYk/QN3U8KHvfIPc3JdCOyxq95QEbKkHDoZpkgz2dr4
         Mh7Whc7viyChmYq+uUSCxtff4YSSFByb9VlrF2k+zC+TsO3GohB2FVkrdWuvtBjm4mEY
         kjuZwX3MbRvHBvxU3yM2G5kI+KsXxgmPpKQJTCYSqUTe4qlzuoZMlGTcr/LnnXbc4IzO
         idi8k3QE30mMA8+8NG5tUJY4/V7NKpwdLgS6p4OsJXiWQ34yucq49lXE7/U2Uy53G3DT
         8Gb2cbzdDegvp9hy/zXpKWWYCNj6YORet4O+saDIyUC1O+VjTpcof89Q+lAocVyPCIY4
         aSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596048; x=1784200848;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=COZypUrOl8CK0cis1XpjgwzxDqm1LgwZ+JDD5NZwoZiDw6tvM6fWfBQk3c707mR6+3
         KBM6AD3coa7plc+HOeQxDCrkA9DD1FBJlLHgp+5iMpJqabwON8CAI2ADyqGTWV0pZrxv
         gZn0rNpecuqgJ4zDdQS5qYlsl68PYgSJliVJg2SebVVvGVt3ftGvX6OUB6bh/vRBqSlV
         cfYDEvd3o84CXzUn0ZnLlRjVL/FZEl6/WT/ihQx0FvrjYTH0qJTRpJD4DGZ8tWkOjGDc
         oBXm7uPcdH6+evvrYB0if7VdIoqJmLrvCqHoWTzQT/my6g8q38TGlcDyytVFc+dwAdqj
         Q60w==
X-Forwarded-Encrypted: i=1; AHgh+Rr40GdV8RyFiZqYccaWY57QX4V4h5zLEg4ATBSOsL4J5uR/vc1iuD1HSHFtU4iudWF8pphAOq6Mn6Q99itVyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVjCM/GLL67H1XcszujVMyJhUX7Xhq/vSUfOWjDmwAkZTBNelc
	bFLnWGzTl7eQg7tPL71wEW8CQ8bbwNbhtfV2Zr3ynfPs0aEJsJWOhy68/iYvQs537x3hh+AswsB
	Rv4nWrUeYDag5gz3qR87cV0OVB1STLu/bRzkWAGbdJmJscoxyKBrLNIhHKaaA0ORH/TPCpWgofJ
	k=
X-Gm-Gg: AfdE7ck9E7jv2TArUwk05KIKdoVpsks7tI6MnDYp7OpQzi0AGOUxnWgEb7IompwS5Ks
	Fq0j8pbTH/kpN7KyWp4N4tx255q3pCCd3Xorn/6Zg3GfcNdMYotg2N0J8OOxjS5gKtMCCDGFrOB
	1CnKdSrSv8PHGY+hKht2BJo3n8mwULTTBBVyY9L7tKlw283//UGLRcFs/Oo/1MM5NP863PE0Kbi
	T+trPZBfkBpayhLHDbOWW9PbSYk4dIaPZEX0zpJf1fao8YK9jB+KcaQKZ03FTnvJ6dbMUrJBq7R
	w9yaFGgL2V5McuC61SuegPdtTJOCcvhPHfV6n6CRQ4q1AHyVuPNGKEqVfXgzziFoYTLqxaZH+iO
	YZ3iMhlH3Itw0l+We69IfqoBOgEa8Mn2eZxXJdLDlLjY9o03V+8xmc/pa8+VaMw==
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754871cf.27.1783596047573;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754181cf.27.1783596047072;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm1861799a12.31.2026.07.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:20:46 -0700 (PDT)
Message-ID: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.181086755@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.181086755@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX8uk6k8YpZcma
 PUVlryQzWTtc96YQbBKn2GjBHTcYEEy+5U/rjLbd/gBmcXJnJErFWDILWqjnLGTqLlwo5tUsaKm
 bpQAIJPikKHwsrIX5WEC8T2nmBQ/xJ4=
X-Proofpoint-GUID: fjBejAhMckmo2ASP6V0Zd6Ioz3Nooq78
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f8410 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=uucGcSui7XbmpEV0VHgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fjBejAhMckmo2ASP6V0Zd6Ioz3Nooq78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX9ijyJc1EmbpM
 mSEPQ0WDI6ZPvaKsn/Ggq8I1215hwi/6KQf/f0e+0ZejKtlIf7qvtM2rghR+5kD7nZI5jOAtri7
 dIAQMfyR5TkSIGIznqfYU8fsYLehwOQGoFbEfwEp+EavR2R9vCB33M8oydtoSpLDeIC9wBkRihW
 NqN7kabvh7iyZSBCfN/Kz1v9ERs3PCOy+ZCIUWvZrmE6k19O6I6f2cwxcebBvd7Qz++JrGQTHEa
 ukCJu6QQAYzh/vHqPvKlvekgQdygDseZN673VBn8q2Bmbo6VmEdnD5CNqVg3L6jaBqSceuHWZNc
 lahg3EpmDXyDd6f+iPROAxtqO9gU3SYzW1wY8F+voVyWHaK0lb5rBooKHYW4hBS9cVqFVbFKNSv
 ZDrX6ADr2SpDjlupxGMM3wRq8x6MhtakzWon+8GymRhMSsuycxzh2r04jJlMLgM7+V2nl2QUd9i
 4+PAtyBFqDCf+/vWdrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042049_800173_78A6557B 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/7/26 21:06, Thomas Gleixner wrote:
> rseq_syscall_enter_work() is invoked before the syscall number can be
> modified. So there is no point in rereading it from pt_regs.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   include/linux/entry-common.h |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
