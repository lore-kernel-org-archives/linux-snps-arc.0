Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4ACC7113C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Aug 2023 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNvJ2dB016ATmUHP/TiMFwqVnUgcGF91y2X43FXnSoQ=; b=a6GoMxGyFJ5JrI
	GjSGlbKP9EvovCO5QZXWQHrXMfmruqgMlTkHJrpFZ+R5ZZrpTBXBsRM4V51vX9Es+trTOt2B2v5mG
	255X6umHrwL/ekHRXEsczZ5zpkjU7LQF+lVblxk5WFN6NBspcAZSmeBa9CwbsTHPLUAnMwRnj29+a
	bNcQgPaC+bzMPoMoXgYMX7zL1rOU7XrYhvQbtqSlDAazXEna+xE1uUiwWpnBrGtB6tzAtz6Pym/DW
	La2bmPHNj5760jM0yK5YO1wvcumT0/DADV4uNODCHI0Rane5fRc7adJ0DZQ0pK0Tlo0ehILGFteOt
	UzbiLbmDjuvjxjfmZ1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWz3L-009NIa-30;
	Fri, 18 Aug 2023 12:58:11 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWz3J-009NIH-0a
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Aug 2023 12:58:10 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IBi5El031488;
	Fri, 18 Aug 2023 05:58:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=ufyyzEpyXTkpZqw33W1llxytN+p1ofrkOes6Lqysxsw=;
 b=OGZ5K96tawTqPKa3TZKEql5OqHSAW065GBbdxrNDgmrWfEzpBB/T1rp6xEMC4lmq2tUY
 hlVezulbHP0hKrqJpZRPcWYav66OyVOdokF1ekjN86uc0JKslLbS74lQr+eyQzmFFjlO
 7Vfx1T0ncra/LNSTyQaIfICsqJygaJR8gxqQpSkxgFC7+FGTgpALY6mGFhYHNb0d/ODO
 zx1AgvCrkTFqflwVk3KUnstRKmGIlD6JlcKj4t5r9/NR1OKo4bthE/qKl6p8NzW2Y/Z9
 fL1THI1TYPLNSRX2+k0m78ytXPBiEOv5PtJiNdoKquVuhVnvKXM4KrIcpw/lKDinmZv7 CQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3se9b4c2mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 05:58:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1692363483; bh=qHpsQ0tFaPEupxawAHv86oO08pslotleEgj9U4YDwi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FlMZjKxntC5CnJwMGADG2rOL3EkRg1T41MuE7YzwSImo4o4PJnOGs/vL5bFpxUhzj
	 TndR4JZhdxRTwspOYNbtxZVZT34Q+T6avcHKCg2vRAqZ5zExWgUXdjxXgiDBZTMerF
	 WeIHG7TiZ1+AP7eWV1pgTgjzTDsl3nyCC8Q2a8nOjxK7EC45SiRgmD9/EOO9lTUIUX
	 rEgYL+1SJPyr/7EB3Xpviy7wW1bGXMRrrU4KgzyeNs1Fjrb0TzqhDz//AqMJJTIvg3
	 ju1pD0S3zY4cz2cBjZEGmKMzPX049OVA6w6PcW6eYPQdKfhD0UM8bCR/QBKeFJNxzO
	 lobLb0j0iEMNw==
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A97F40130;
	Fri, 18 Aug 2023 12:58:02 +0000 (UTC)
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.111.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 54013A005D;
	Fri, 18 Aug 2023 12:57:59 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH 16/20] ARC: entry: Add more common chores to EXCEPTION_PROLOGUE
Date: Fri, 18 Aug 2023 16:56:52 +0400
Message-Id: <20230818125652.3981-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815004813.555115-17-vgupta@kernel.org>
References: <20230815004813.555115-17-vgupta@kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: fmd3vWRMNdnyDVGKsAJzyPQELFWUskQE
X-Proofpoint-ORIG-GUID: fmd3vWRMNdnyDVGKsAJzyPQELFWUskQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=497 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_055809_259980_F02E8597 
X-CRM114-Status: GOOD (  16.89  )
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

Hi Vineet,

> Subject: [PATCH 16/20] ARC: entry: Add more common chores to
>         EXCEPTION_PROLOGUE
> 
> THe high level structure of most ARC exception handlers is
>  1. save regfile with EXCEPTION_PROLOGUE
>  2. setup r0: EFA (not part of pt_regs)
>  3. setup r1: pointer to pt_regs (SP)
>  4. drop down to pure kernel mode (from exception)
>  5. call the Linux "C" handler
> 
> Remove the boiler plate code by moving #2, #3, #4 into #1.
> 
> The exceptions to most exceptions are syscall Trap and Machine check
> which don't do some of above for various reasons, so call a newly
> introduced variant EXCEPTION_PROLOGUE_KEEP_AE (same as original
> EXCEPTION_PROLOGUE)

I'm observing the ARC700 (nSIM) system freeze after this patch.

...
f0000000.serial: ttyS0 at MMIO 0xf0000000 (irq = 24, base_baud = 3125000) is a 16550A
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [uart8250] disabled
printk: bootconsole [uart8250] disabled
NET: Registered PF_PACKET protocol family
NET: Registered PF_KEY protocol family
clk: Disabling unused clocks
Freeing unused kernel image (initmem) memory: 2856K
This architecture does not have kernel memory protection.
Run /init as init process

> @@ -128,11 +123,6 @@ ENTRY(EV_PrivilegeV)
> 
>          EXCEPTION_PROLOGUE
> 
> -       lr  r0, [efa]
> -       mov r1, sp
> -
> -       FAKE_RET_FROM_EXCPN
> -
>          bl  do_privilege_fault
>          b   ret_from_exception

The same update is also required for the call_do_page_fault wrapper for ARcompact. 

Regards,
Pavel



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
