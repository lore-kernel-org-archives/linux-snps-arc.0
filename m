Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269C8C433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 20:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC18A2067B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 20:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYl2A8/z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KAIQGSGX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mC6Pjwxr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC18A2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pilwDQASwMfoxbgLxnyQC07BEz75Y1jH+BttYVSFCv0=; b=iYl2A8/zhnI69z
	HTHdtYKODd9ULLqcIJ1bYzJTRqx1+H+NCkdKzgozh3H+Dt9kaveK+ersgB6mjBzQ0U0efTOFirA4e
	lCNxVTgSzfpwkQ0az1AjddyfortXY60cMme0kzmTK2mTY8Rr1EVSeoRvyDjdR+IMO6ljMAIp9B0qK
	3A1xX3W7h1groSc+x4a6CqKV165k9GKIYRQPRg6Esqex/E4aiKzLdWUAcWw80KHekeUGCNhfqAQjr
	qCzore/j3iJp4k54Q7Y2Mx4K71Fh9M1f33TM2x7Sju8JjpEcdFQjw/CpbvWZxm48QZM5ouQw/BSYY
	XNE2NStaEYeM0il59uIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgZqR-0001Tu-4T; Wed, 03 Jun 2020 20:18:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgZqO-0001T0-9l
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 20:18:37 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 095CB40655;
 Wed,  3 Jun 2020 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591215516; bh=OrWWOGA2XPba3rHAcrV/Q+TBwV0MiA68fwqg7Tkaw8k=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KAIQGSGX/ZIfAjC+YEyuB2HCv+wBjGabezH+a1tUxXl5X3uDRosJv0ML+6GUVAmu8
 xKtMCV+wPNWLXFiFyB3qzjzwYCZsyonk2/Uk9zRpx/mCKBiqf4WCY+G/25VkMM0FTK
 U2N6Cb7tdY3OUUW6olaDCpS8Q6rFPMX30HzjaG+aJlZXtiQ4HQjrPx6i/SDL5xpAwJ
 rB8YDzxDhNo20Dxn4ojrMc00yyDtpuAK6MVSMGTziha4aBxYPFp8c5yEFYLvkXE0fH
 Fz7PL2+CksmcRkB4/TRN7oB4/s3cWf18LVSjPzgOsNkWcDFmIOx5YFBh4oXp3O+dX5
 W4ABEZGqEQ0gg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E136DA006D;
 Wed,  3 Jun 2020 20:18:35 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 3 Jun 2020 13:17:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 3 Jun 2020 13:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3dZJOCizo3LPD/1N9zNRuwzmgN0Dzo7ehstHtBgLbl4ebCxiCwIBzzaJnSvs8PL2Rsz7oPPNRaXvxuL8tT8fI4Cj6yZA6psVVgbku++vOCXPZNlhMrjd2lPF/FaWiMOT2V4oayGPsCfQQfApk/rHibf0jJNu1BDBJkk6XwlfBexsM+fgg2ak2Vg/EpanXnZCRSUjnyMAspy6Q44SrBopz/9G6sVJ7OgEC9xJ/MbfbptudjOin/TpsuGML+rcqm4fAdqRkQCRx7DMswwA7ATqjfl65uhirzPgg1MzkUMho2AvYpz0Z1htQowNqZ8OQD7zWMkwFAWgLtP70BusUgxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrWWOGA2XPba3rHAcrV/Q+TBwV0MiA68fwqg7Tkaw8k=;
 b=OeT2jCfBn9zE7X7fJ6zeYdG+OKS4QRQ10J28HRLp0b1OXgB7O9UiuLz+OCp5uUk4xN1RFEP8ku5lKDsCySHgCcIFbPYliZwS8+vrsBXFsdqbzCJl7ksDmYDF5oS7EtQhL9MG5mHcpdlGB9BnjPqdHLdOwD9aTS0Fxmq55BNsF29bO7RplWfVADKY5ZHigUaje/Q3OHibxsgYn9gF+cEndI0Zndl7FSgtcFfh/mmcRf1wtPQu9RsRa4RpH0F/RuHBtJeLbo4uJBF/QyH+H7jrh0IBe2hMubZlp3aOOWkZg1vvfFR9kjYnexvd7o1austM/uNOtVrUBIAsAT8XJeuPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrWWOGA2XPba3rHAcrV/Q+TBwV0MiA68fwqg7Tkaw8k=;
 b=mC6Pjwxrl2ZrdeG5kGjZJyf8JyyhaLMxlLWFbynLIJvKiMER3+H6hQ/A8j+xHQTBGTjfFLyVgj33UxfqkxIsqk0UYtRMWg76AHtOz2/auvncdkdih8LpqYMSeCV9y6a67GDogGVhhqtPTyYbWyHwsfzlYtG3F6zMRq5LQDYFQ2A=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2903.namprd12.prod.outlook.com (2603:10b6:a03:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 20:17:44 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 20:17:44 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v6 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWNdk7jGc/VtI9YkWN6o0lqZFobKjHU5GAgAAFGwCAAAO0gA==
Date: Wed, 3 Jun 2020 20:17:44 +0000
Message-ID: <f1bcee1a-f061-a0b1-6cff-6a9526425257@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-8-vgupta@synopsys.com>
 <248259c7-8263-805d-56cd-9db397eb9c04@linaro.org>
 <b047f6c9-58e5-c78f-d949-52ca288d3fa5@synopsys.com>
 <f5e57119-d034-c220-4235-4e57a3bae015@linaro.org>
In-Reply-To: <f5e57119-d034-c220-4235-4e57a3bae015@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66f44cc2-985f-4c16-cd87-08d807fb2d00
x-ms-traffictypediagnostic: BYAPR12MB2903:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2903D4077F21E9DE3219BFF1B6880@BYAPR12MB2903.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:480;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqt8CkCl5ReCLtO35ewfoDgJU/firXJjivTOFwSR6l6FP5/Nl7qqKnnjIGBHGYpAK8VQUBjoPAaiklPF6hG6gs1fUKP5cW0ed8blwrTj1ua+SYB9w8BMijM337d+Ytom6oprtR8isfzh6UwWets6vQ46cRL5KscAXBZEeHlDvlwM3G+clYJlYBAc721yvUUUa/7EMScw8EhRHSfSDQcr04UuTjg1WaK84t9BKt4+pEu7n1A6YDF63Kl2RMUYabx0/ZtAHA9YBnXC8CayzyiowAT2XCImooRWhIz0kMYkdOzf3DMxoI2XEmiTWEZ1r+FB8ZZOP2WjYU6Gw07UCZdYvXDwX58cbwHd3yruKdJXu8GKGldsBOoW//RUe85cBoM9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(39860400002)(376002)(396003)(346002)(76116006)(31686004)(8676002)(316002)(478600001)(6512007)(5660300002)(110136005)(2906002)(83380400001)(71200400001)(66556008)(186003)(6506007)(4326008)(53546011)(6486002)(31696002)(2616005)(66946007)(64756008)(36756003)(8936002)(66446008)(86362001)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TmOmTsX/gKwD3cJbxLoWJUoa2f9aF+/BA+luftRzdbFhAtdhUR9uHYWbqLPVJrT+a6wGjAuqfuR1vaRvnzy0V9bVKfxEexX/sIEAR1/gZHtW+lmXWq6Jee7CB1mM/4RBiiAr+YNm87UuuT01874s9HzXvoBmqBMJFOvj8d1P1vrS3NsQ17cyIXrILy5IC/pF0rRNlAUoGW777/lKsDNoIAU94RQ2ciB6blanQV3luZlcjc1SQNV6b5YRsE77vsoGxO/CwXYecNMUpRTtL9qzPHy1bB/xPAJmg1VmXbv7hihbgQIOVhJWIqCPCDpTkazDcLvvqineodzvSWxVlpYnSgiQR+mdX4ttToXqru1XIUdRtBpq9f9WluptfXDwuQj+3HIJPWoORI4Li/BFrRqbTs6+Hh54PN6IU5lqD1rFo8xPeZm0ZedXu+/HdhlDPtpuQrwLB5M/aE0309nL+2u0r2GY6IJbuPED+MeZ6dH3whNoiDq/uPj7ypUiTOYbwJei+BsbzUbrEDIoTgBb/CJANbXY+dGz/5/9yNOnbqun7rUm3JWBWQHfZNKMGD+LEGYR
Content-ID: <3B021AE36786264D93FBA0891024DBC2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f44cc2-985f-4c16-cd87-08d807fb2d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 20:17:44.5188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0oNt0WhvE7xCRIkZDUx+vLLXqIOxtA95XjQQibMVYSYPiKgMgGJr+i58Rw098QBBva5rsDCc4xfGvrl+9KIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2903
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_131836_351787_E2AA89BF 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/3/20 1:04 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 03/06/2020 16:46, Vineet Gupta wrote:
>> On 5/29/20 9:49 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>> +	; ----- child starts here ---------
>>>> +
>>>> +	; Setup TP register (only recent kernels v4.19+ do that)
>>>> +	and.f	0, r12, CLONE_SETTLS
>>>> +	mov.nz	r25, r9
>>> Do you still need to set it since the minimum supported kernel
>>> for ARC is 5.1 ?
>>
>> Right.
>>
>>> It should be safe for internal glibc usage, since for both pthread
>>> and posix_spawn it blocks all signals including SIGCANCEL and SIGXID.
>>> However this is still small race window if this is called directly 
>>> with pthread cancellation or g*uid in multithread.
>>
>> I'm not sure what you mean above. Do you mean not doing this in glibc and even if
>> kernel support didn't exist should be safe internally ?
> 
> At least for internal clone usage with CLONE_VM within glibc we explicit
> disable all signals (posix_spawn and pthread_create).
> 
>>
>> fwiw as mentioned above kernel sets up TP for clone (SETTLS). I detested doing
>> that for a long time, give ABI implications but ended up doing it anyways due to
>> an actual race hit when running uClibc tst-kill6 [1]
> 
> We explicit disable all signals during the create_thread call in pthread_create
> (b3cae39dcbfa2432b3f3aa28854d8ac57f0de1b8), so it should not happen on glibc
> anymore.  However it is still an issue if application calls clone itself.

The scenario there was pthread_create() and parent getting scheduled before child
and immediately doing pthread_kill() causing child signal handler to be invoked
and signal handler doing pthread_self() which was broken as TP was not setup.

With commit above, parent pthread_kill() will block and will only run when child
is scheduled and unblocks the signals !
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
