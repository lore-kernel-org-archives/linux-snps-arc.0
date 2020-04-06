Return-Path: <SRS0=4mcz=5W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EADBC2BA1E
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Apr 2020 18:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A9B206B8
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Apr 2020 18:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYdDhWKd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EWweRNSB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JeJKAPNR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A9B206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YL0W9MXOWmbidqgOx94pKagyl0zmtOMLXTZ7+d82/W0=; b=aYdDhWKdPE5MIS
	At813eFiOctj8YJHbrAFSN+SzwckTiir1ZuTndLEAfuiUj3SFYzA8MIDu7aC4duA9OCHC86H3Z+8R
	QbkjEJUMzE1FtfVNVDX4Y1ertnJHnzAmHj2ZddOwnfKeVmmSUhCD5uEaNI3tPFVqOjOBLJRRBFHh+
	G8ujd10xOdrCwPH5d31ld6Ub7Bxl5eK1gAtgfdBr0dAGZdvR3TQ3se0NxnvP3BZtFxhCjuSrCHzIg
	j485mpaPEGbDaQ8vzjXfuRMMjSytVAJrlNOSs5ybcWAc6TatDUtiXT8tJbzCADY5/GnxcAn8bPrtg
	N8TW5TsQR2jZvK6oi42Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLWtH-0004ws-8K; Mon, 06 Apr 2020 18:54:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLWtE-0004wP-HE
 for linux-snps-arc@lists.infradead.org; Mon, 06 Apr 2020 18:54:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF3EA4050A;
 Mon,  6 Apr 2020 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586199271; bh=KJyngvC2r8g23yWX/dTBVnxhVSHAMSSSglP9r/CNtvg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=EWweRNSBf0OSOtsiWuxsanpvJuImcGSRAVqr5bRR3QBnAkDT5wIBOJKW6ansqEjA2
 JJcClkcLqN1r1m82hvRStsBA1/RjNT/WS1Sq8cQg99Mo32M7HGe7E7k1nYIJJCrzCL
 +SuDR3ZAdZvKwsS5wvljNDvm6Pjj2Usd2oHAt8voUdeL2MuEWDLnIEvdO4dQL/lPOb
 Kqg+1c/jEuKnOyRIk8GYzIkYvwjaz8L31bNkyzHFpL/ITd+J7cWeiVJI7xoZiQ/ojM
 5MsR1qeH2RBvTB7Kkg3Dwer0InezTH5l0r7Ddp5SNbVgL3xBmpiw2OxeSWumAlpOhV
 58thvKKZUbQ0A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 961E0A007F;
 Mon,  6 Apr 2020 18:54:26 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 6 Apr 2020 11:54:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 6 Apr 2020 11:54:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW6OH8uXa35Z/JTcJRlY7KsK/2QzBEbT/QuNMbiVcN2GWchOhYf9HHVlrgAO317Z8YuLTr+Pi1rxnA+Pm9oy/c/OvEF4hy+RoReW3wA+XI155DlAgP5PTaxXd8lUcIo5xAaofoMKbkQp0Gemvis6kfL8ami+eZQeBYpaYTqo5/wwg/wjH5posCaxa9Om2odyPxLDjNsRu4lQKloIJlcRdhoJ55RGHElFDjEBdPZm3DB5F4epSM5h6IydT/pGbdwcnceupBy98J65DKJO93oENn2R6PWhxl7uCYGQP1Y6tABKq5N3GR34ZECtATuizYSaDTHsP9LbL0hRKiDkosw8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJyngvC2r8g23yWX/dTBVnxhVSHAMSSSglP9r/CNtvg=;
 b=dtffQeGXQp0w2v1bj+RayYLQLuho2M/hKmz0N0e6VOmgFcSBZ7+UG0v0536hx77BJm2c6V3a14/SXktBgiK4rH+Kcn5BPLrV7LdiUJEjRTByDaZlpPmQprVFvoon0jLdJq4uX8hC2JmddCbX4K8sGPuk9ZEsRgPxibLpgGFnhUj+bx060Sag2MS3jgM6fMKDxQH3ctpAhZ7YKccJm4xBSg5l3tNPqtjTZ+CrBn6y81QzyxlAL1zGA4IA/LptjSPktkbH8RjOe/xNXhGsY/+W+47yKgt6EmrIkUjKwemv50Yn0xmQPqjtoq99eN8zwuULntJNFlR16wzdPMmxKVIM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJyngvC2r8g23yWX/dTBVnxhVSHAMSSSglP9r/CNtvg=;
 b=JeJKAPNRS85FtqCooUf5EvCoj4uDt4GviQNgmc+xy+6trkm3lF0p+JaFPkKXrfOJ+zgolRYpH3n+OJa56lDaiURSulu+LT28/dKI3uc/h4T/BWkFn2/uLO6p44Pw3jZYFVwgieqlskyNBcEi+J1b4wg4lyF0Eqg9rsBu7V6ahAw=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2661.namprd12.prod.outlook.com (2603:10b6:a03:67::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.21; Mon, 6 Apr
 2020 18:54:23 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2878.018; Mon, 6 Apr 2020
 18:54:23 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Topic: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Thread-Index: AQHWB6YXXY4j5+K2H0eFv1trJub2pqhsekUA
Date: Mon, 6 Apr 2020 18:54:23 +0000
Message-ID: <c87dd5b4-8be6-714f-3210-4cbfbe89a069@synopsys.com>
References: <20200312183325.594-1-vgupta@synopsys.com>
 <20200331214717.23902-1-vgupta@synopsys.com>
In-Reply-To: <20200331214717.23902-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f95cd8d-73da-462a-a08b-08d7da5bebfb
x-ms-traffictypediagnostic: BYAPR12MB2661:
x-microsoft-antispam-prvs: <BYAPR12MB26611D202D9372B99505C7D8B6C20@BYAPR12MB2661.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0365C0E14B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(136003)(396003)(39860400002)(346002)(366004)(36756003)(81166006)(81156014)(6506007)(2616005)(8676002)(4326008)(26005)(186003)(54906003)(31696002)(316002)(53546011)(2906002)(86362001)(6512007)(76116006)(64756008)(8936002)(6486002)(478600001)(5660300002)(6916009)(66946007)(66446008)(66556008)(71200400001)(31686004)(66476007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z8Z7cAud8Ak7GgFOMZp4uSXlnLxZtQ5kyI/YdqgSo31c2YCuTg6/6WZ06GxEXC4YsApubyZA7XgKQBqtRIClJ4InA7lAhL3+9o+oS+SDYn+UFCF1olLjg3ba8kZ+WM1ayDR278MI3YZZ80FgfJaWCsTN0FHj0JmXhrJriFsinpw7gClXhz2VULp2Ff4qyGWPpIYg4CjNTKiKrdW5Q0lngnYuOOGQr5Nbs+2fMHcEsO0fDN6mtUII8OKOJcstgpejFwtlMt/eTr5b9fdiHmsQUL3qZ1b3gBGYsvuU1Wik4SvDoG1TIu2Gphjqw8sZNQPU4NEX+J3F5qDpfmo2Njg3fjjIRI69vHMufX9jzHXobrpOu+F2cqZrwN0N2wVvflLm3je4dju0Nl++m3pevYAbZ5iw+hj8BrSUCoFhfEr987UcaOEIHn7zLM6ntpKWAxrOf6g2seGSjSbWZGZSWAlcHHYV84bXkKOXOVmUyIJ0Evh0q28Q9WTJqBr2R+ZdCUCQK2MIZooSm3JCByk5Z8kDbA==
x-ms-exchange-antispam-messagedata: 0zu+JeQsDn6zsHw85or9kA1ScVywGMvP5PwdQDbMw0FgDK8nf6c3rSN7db0E2svvsK0O+bgF0/XTCA68cBiu2+Ya0P8witRmlP0/xWZwdJo5Em21IKEA2+nrdp4NZqwh12sQNhpYkZlRIbBxDg1qhw==
x-ms-exchange-transport-forked: True
Content-ID: <8CAE8A5F75E2804DAE45CA4933288B03@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f95cd8d-73da-462a-a08b-08d7da5bebfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2020 18:54:23.0521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSNvX4+8Tw/5PxWF0o5WL9WJwSQqmxeyllXULLc7hTzaN/0rWfMF3XiJBNGNfC7gVq2isMe7s7piH1o2y7rkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2661
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_115432_638835_B1A5877B 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/31/20 2:47 PM, Vineet Gupta via Libc-alpha wrote:
> From: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
> 
> An older asm-generic syscall ABI may have kernel provide 32-bit
> time syscalls, so undef them to not mix 32/64 in 64-bit time regime.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

ping !

> ---
> Changes since v2
>   - Made x32 safe
> 
> Changes since v1
>   - don't redirect these to 64-bit variants
> ---
>  sysdeps/unix/sysv/linux/generic/sysdep.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/sysdeps/unix/sysv/linux/generic/sysdep.h b/sysdeps/unix/sysv/linux/generic/sysdep.h
> index 40b4b955ca1b..b83e17e1c9d1 100644
> --- a/sysdeps/unix/sysv/linux/generic/sysdep.h
> +++ b/sysdeps/unix/sysv/linux/generic/sysdep.h
> @@ -17,6 +17,7 @@
>     <https://www.gnu.org/licenses/>.  */
>  
>  #include <bits/wordsize.h>
> +#include <bits/timesize.h>
>  #include <kernel-features.h>
>  #include <sysdeps/unix/sysdep.h>
>  #include <sysdeps/unix/sysv/linux/sysdep.h>
> @@ -25,3 +26,26 @@
>  #ifdef __NR_llseek
>  # define __NR__llseek __NR_llseek
>  #endif
> +
> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
> +
> +/* Don't provide 32-bit time syscalls even if the kernel ABI provides
> +   them (Older variants of asm-generic ABIs e.g. ARC).  */
> +
> +# undef __NR_futex
> +# undef __NR_rt_sigtimedwait
> +# undef __NR_ppoll
> +# undef __NR_utimensat
> +# undef __NR_pselect6
> +# undef __NR_recvmmsg
> +# undef __NR_semtimedop
> +# undef __NR_mq_timedreceive
> +# undef __NR_mq_timedsend
> +# undef __NR_clock_getres
> +# undef __NR_timerfd_settime
> +# undef __NR_timerfd_gettime
> +# undef __NR_sched_rr_get_interval
> +# undef __NR_clock_adjtime
> +
> +#endif
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
