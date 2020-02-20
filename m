Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8F0C11D0C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 20:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C879F206EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 20:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Su1c/o4K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BUHWhEpb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="KTKj+GXq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C879F206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUcB6PJk/fNFnmN55OvhooLDPJB2SUCZrdwFt5hKlf0=; b=Su1c/o4KF1hc12
	YX0W6SgB1JLWgTmcExld7Q5aaWzgLJgKiv2KONJGE3kRbGfV54wHz6NSW8r4xe2mYWGGQRv2mOjQX
	ht1qAc3cwXm1DFp0sHTc6ozKQmSDQwPninkCiuA+IQwud0r1Zrcvvxke+v2Oa6vvivuhVXidl3iuy
	PTx1n+c/ZoBkzq+vfEdFDAG4JE6K1e3oSiB5IaTAv3eGX7+7lXTFKj4LoISgP3JOEyDH82NYTVSGp
	HCg9P2jUbrBmG3OHYUZWQYrGqwQjZeF5FO4vZ4/sjP8Yw4mOSsmkLrU+cSRGU6V0Sjt5RTcvbBB9N
	XVVLBG5IYPtTTc/GncOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4sbt-0003mF-St; Thu, 20 Feb 2020 20:39:49 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4sbq-0003li-K6
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 20:39:48 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EDF23400B7;
 Thu, 20 Feb 2020 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582231185; bh=vtp8iOOps+2l/J/ApCSWtxzxGByFXAtRvUvMbj20srQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BUHWhEpbug8I7vh5uTfWMMm8sKt+1RyDJjhBb9T3LJL1CZWE0VVSMQQLzYd+0xTr1
 6ob4yDuyRfcRKNnmciJQKm7HEbpGNRnAmrHvpIurubYldHS75LCyx+zyzoHXrV/bpM
 ktHywYI/bDYGJZRrQkjAXGcDMWHMPl0+DwpfdozLA8ocZeZkScradkwXK+5hcoTWVP
 GFqjGkK1ZBM0ITjxQtW4dK+hsmnNCoO8Ykdmh0gOjr/g+HZXmy2cnfEVjBb2rBONDC
 uulFeQwpYB4FFDiGoayu5hWL7VWj6OQEChJDJrtUFXpnieYrTp5DQM085q2JEbpHjI
 16+HJVYZD8XKQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7367DA007F;
 Thu, 20 Feb 2020 20:39:37 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 20 Feb 2020 12:39:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 20 Feb 2020 12:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpJK0cvqh2YBOIDtQTspZsuXNu0j9ACVENYAgF+ODuM3e3UqEUBQPpNs+uDRfZOeGjEmTW8gxB8p2bG0Q1KWvXiT+SAbdw7zXogGk5/mfD2vL02iSYUdHHcvADgB0Qpx18r5QOTlXHTUwyGx5KhSn2PpKRW53pfmZqEjS7fp9r99xGx0MUiH59blvpG+P4qRx7MUJWGg9OrISyCxZPiy/MS1n2DHFKIqmSKijDzQiDhY0vJ1o1tHrCPBFA7NgwGZPDlaRl1PCJbbfPAURIzQGnhQQel3VFmJ983tjIfYWbQfRzOyL0VlDH4TAeLtxy9EOJZhRZ7U4cqZ1nB3XqJOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtp8iOOps+2l/J/ApCSWtxzxGByFXAtRvUvMbj20srQ=;
 b=Q6Wu/6HOnQnjNZIsU9fWusL8t8A3+XIRqv3yA0rx6lxnvXnf8Fdlk5pICXFJM5rmV1xFacXSOfPc5eZS+ureQaMKyRWJg+0QSblUoiCjcjmuekrDeqaVUd6c6AsAbYK2UwlFQliZflp2FHsn+BMdQP+lNl1sA/TEvJAzD1AY1gW6dh0seYbs7WkAPBayYllxeGHGb4twqW4aQ1457x4tF9yTZJMpeZ89kgeRiyKzMYXj4dUIcZ6SvBkM8pb2RtKw7ikLXb/Bjp8QaYKEpSQT19/NWRgyuTRbhgYBz9/eHr4lX122cQ/Nql+PBqUTK4FAScHnqEECiH6Ci778ETfeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtp8iOOps+2l/J/ApCSWtxzxGByFXAtRvUvMbj20srQ=;
 b=KTKj+GXqPoR86knybBr3dM2sBd6bmv13+hcgWOKsI/RNchgKGcaO57PhrPUKCQK76hGqp4+1KzQi9EB08016hYNoDs3Rs+3n2LG/DT2tMIKDBS5KWfgLdlRSih9QGtZHsjQribInD1I6B3+Mc442rlUwtU8iBTtxIWjtTl8c4/U=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3429.namprd12.prod.outlook.com (20.178.55.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.26; Thu, 20 Feb 2020 20:39:30 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::5d03:e088:d949:7f24%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 20:39:30 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH 08/15] nios2: Use Linux kABI for syscall return
Thread-Topic: [PATCH 08/15] nios2: Use Linux kABI for syscall return
Thread-Index: AQHV520xA6L4zHMr7k+UQPRfmajf76gkEJkAgAB8PoA=
Date: Thu, 20 Feb 2020 20:39:30 +0000
Message-ID: <8f88415f-18cc-17ef-91ca-b0dc101558d9@synopsys.com>
References: <20200210192038.23588-1-adhemerval.zanella@linaro.org>
 <20200210192038.23588-8-adhemerval.zanella@linaro.org>
 <10265c86-aba3-12f9-9208-4a4c6ad31d28@synopsys.com>
 <4d32b8a1-e294-d2b7-f150-2c55281614ed@linaro.org>
In-Reply-To: <4d32b8a1-e294-d2b7-f150-2c55281614ed@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07f52715-5721-446e-56ff-08d7b644fc48
x-ms-traffictypediagnostic: BYAPR12MB3429:
x-microsoft-antispam-prvs: <BYAPR12MB3429089440F2E045710129F4B6130@BYAPR12MB3429.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(6506007)(4326008)(8676002)(478600001)(5660300002)(53546011)(86362001)(36756003)(8936002)(64756008)(2616005)(66446008)(66476007)(66556008)(26005)(2906002)(76116006)(66946007)(6486002)(31696002)(31686004)(316002)(71200400001)(186003)(110136005)(81166006)(81156014)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3429;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZHY5Iqd2pDniFJMxemJRfXJ7gqX14g7420ku0BDKCrgPvzhvtgE+OXmJ3lX7pJ1Y7rmz4tcCntqFCaq5WjGLIdV4vjlAlDljDO0WG5RVr13lbCzTLR9ZjVWFTlZqOdAtHsE6vEgr8vsOuqr7aRUh1wnD/T8ZS30oAF73eUgzvaDHaQfqsKuuwknY8iB542MtFSSBvJDb6tZNrFfadUYm5YqT0fPT9znyo8m7Eqt8l6zcWV4wd2TmkmD3umLXuTNsrjMipkIoK/88SA8kJd88ipT2rLD61SIesJeVIQbZi/G9SzmgdK9VBbAbkqJ7CsCEJQivPXINyKpOY8nuQ3RajpS5HK7Ysb4oAPgnArcxLh2aVdXclMGtaOMzpnNz+U0buVb/Af/JUFRL30iot1qbqxjIQPuf5ke9NJENLnqB3Z6mZ0AhLAZyf46xHwkgGqu
x-ms-exchange-antispam-messagedata: otD75WYOMdO0HxN2xMH1GJ8IgdRcESFjBT77YkQ4ZBrVMJASDOlrwIBlj0TY7SydevbC9ZVlIJikCJpOMy6iDzxBrogOo/m1Xodhoibwa8pFtVd6JChjv/cg8dEgGkbVkPi75ZPJxuCoU2vzDmYT6A==
x-ms-exchange-transport-forked: True
Content-ID: <3137D936AA1769438E0DC7D05A7EB260@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f52715-5721-446e-56ff-08d7b644fc48
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 20:39:30.0216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tPqkJIk/yIuq0d5GOc3ZS2C31eT2vCcJGBdZ33KYGmyd7KhcBEKrFCYvBj1mQ4R4aux7VMqd73DevYDplohkaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3429
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_123946_735072_3AE74B16 
X-CRM114-Status: GOOD (  16.26  )
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

Hi Adhemerval,

On 2/20/20 5:14 AM, Adhemerval Zanella wrote:
> 
> 
> On 19/02/2020 18:40, Vineet Gupta wrote:
>> On 2/10/20 11:20 AM, Adhemerval Zanella wrote:
>>> It changes the nios INTERNAL_SYSCALL_RAW macro to return a negative
>>> value instead of 'r2' register value on 'err' macro argument.
>>>
>>> The macro INTERNAL_SYSCALL_DECL is no longer required, and the
>>> INTERNAL_SYSCALL_ERROR_P follows the other Linux kABIS.
>>>
>>> Checked with a build against nios2-linux-gnu.
>>> ---
>>>  sysdeps/unix/sysv/linux/nios2/sysdep.h | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sysdeps/unix/sysv/linux/nios2/sysdep.h b/sysdeps/unix/sysv/linux/nios2/sysdep.h
>>> index b02730bd23..eab888df32 100644
>>> --- a/sysdeps/unix/sysv/linux/nios2/sysdep.h
>>> +++ b/sysdeps/unix/sysv/linux/nios2/sysdep.h
>>> @@ -157,13 +157,14 @@
>>>       (int) result_var; })
>>>  
>>>  #undef INTERNAL_SYSCALL_DECL
>>> -#define INTERNAL_SYSCALL_DECL(err) unsigned int err __attribute__((unused))
>>> +#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
>>>  
>>>  #undef INTERNAL_SYSCALL_ERROR_P
>>> -#define INTERNAL_SYSCALL_ERROR_P(val, err) ((void) (val), (unsigned int) (err))
>>> +#define INTERNAL_SYSCALL_ERROR_P(val, err) \
>>> +  ((unsigned long) (val) >= (unsigned long) -4095)
>>>  
>>>  #undef INTERNAL_SYSCALL_ERRNO
>>> -#define INTERNAL_SYSCALL_ERRNO(val, err)   ((void) (err), val)
>>> +#define INTERNAL_SYSCALL_ERRNO(val, err)     (-(val))
>>>  
>>>  #undef INTERNAL_SYSCALL_RAW
>>>  #define INTERNAL_SYSCALL_RAW(name, err, nr, args...)            \
>>> @@ -180,8 +181,7 @@
>>>                       : "+r" (_r2), "=r" (_err)                  \
>>>                       : ASM_ARGS_##nr				\
>>>                       : __SYSCALL_CLOBBERS);                     \
>>> -       _sys_result = _r2;                                       \
>>> -       err = _err;                                              \
>>> +       _sys_result = _err != 0 ? -_r2 : -_r2;                   \
>>
>> Is there a typo here ? both cases seem to be -ve
> 
> It is, thanks for catching it. I have pushed b790c8c2ed to fix and
> double checked nios2 syscall handling (arch/nios2/kernel/entry.S:205)
> to certify that the modification does follow nios2 kABI.

Actually the reason I spotted it was trying to replicate similar changes in ARC
port and it seems to be hosed now. It is quite likely a snaufu at my end, but I
don't quite understand the new logic.

Consider brk syscall which does

     __curbrk = (void *) INTERNAL_SYSCALL_CALL (brk, addr);

Through a maze of defines this ends up calling INTERNAL_SYSCALL_RAW which seems be
unconditionally converting !0 value (success) into -ve and returning it. So won't
 it convert a legit brk address return into a -ve and save in __curbrk.

Am I not following this correctly ?

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
