Return-Path: <SRS0=zcuS=5S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBD7C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 01:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B13AB2063A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 01:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A1pH6KDM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L2xXYQ+c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hO59BS7u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B13AB2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcw5Ez3p71r3gAKgXo0E6kdYfi3C3wgCUtsw2Cs4L4c=; b=A1pH6KDM0cNnsl
	zaYad0bZzu0EsKL9ZF0HrBi9vRrCBEB2k9cNxahRcBwrKkhkpyrhzKNaD9CRMRDVA8GUiqEpr2hSO
	SzHaEUy5dUi0Isnd0tcGI5e8bbHd9Kd7jqOl73X2aKWtei0CvaJDQbGKpOVo/3NYgC2EzXnUQn60Z
	/KkyCvMwLTp8h9kvYHnAoM2Zl9Yb6VH1Ay98VVKC+DjZu9oxBIuSRm7yntVlRW2NnBbU5y/uP5AqM
	Rr0IAduk3T7e1Fb6G5tV0JqjyiNp/UlSBXuzUY/l2WtBHCj1gLY+s8MleWUuNKVta4iq4Vld8Q88s
	JRJhsnG+kjPlRBnTqWEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJoUJ-0004ZQ-Hr; Thu, 02 Apr 2020 01:17:43 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJoUG-0004Xr-ER
 for linux-snps-arc@lists.infradead.org; Thu, 02 Apr 2020 01:17:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6751F43BA4;
 Thu,  2 Apr 2020 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585790257; bh=CAHC31azKPmIw9jnf4UyHUygo09Hsthpa2qx8+lj9os=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=L2xXYQ+cr6jjPWhh7e4yLQBIEA2F0IOiU8lGr/ddClclgwA6+FxfrBr4vf5TUNsgY
 ZZNTRRP2H3LRRPgZ5rJpcRQ1gX2mCvuDdPKLuxYNPJUj6BBGc4C0+g7AkbnRO8n8lu
 Er/0AYhIGw6fHRkGBuQT5oPNJuK0MO6kPuvOS+qkEjTkUeec2zp86URkSeiyqQGRK+
 TMFGR3h/kXsr41f1Ihd04zbYllKULo7lfostvXb0sTsNQz+2Wps2gGIORxYPdEuWbd
 Y0FtmT4Nu993lQuSg6DgtzjanWiDp9M7DzmRuS/0EYALMQaVD5oFLqkf0vhVuzlEnu
 54LjpkMkra4uQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 41652A007F;
 Thu,  2 Apr 2020 01:17:37 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 1 Apr 2020 18:17:05 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 1 Apr 2020 18:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUUsYRfB2PbLish129Fw1pg9L49mt4mYeUNd4J4SPB1gJx0HTbUJNhKm57akeWMvHf8wi8uXvZDM/7LaWM63zMXTqMeyBX0aV+ZC0lQQBtF8Le6M9QOuGYb8jfnLPTpRHFlPFNoQINxleIvFClCEAIvszzSkNvx+UwJpHfe4C9NGgXBc4zIVxbhN4EQFN1PEd0uUhMOe1Ik9VQsqjUvaWq4HCHJMOiz6ZoESG4L1Py7UJXhbNW+twowS7oWz6JAa44uQqtsa1ZvC+1Ze3tMNcGuADQ5wrSqAr6oF5VgUmfAKJTq9sxvynA7ow3p4q00AYM2BJbTAKJ6rtlQ+ZPChNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAHC31azKPmIw9jnf4UyHUygo09Hsthpa2qx8+lj9os=;
 b=CDwsAUkQvm2WHSIVDbHuWVhp2nnoHE7KThB7hwkVXAG6dNHjiPNcDXPYN21m3u2E1YGrFx3kd/hrwl04wUfQnLAkRksCEfZM7RX1BhTNTHY1rpC+lU5vqdejB+fy8muNNUzZalvJRZvgRTRFtGkrkPWFRZywqI5NooFNoBHyP2Iaz7jBS8zci1KhXgRQkPJmTu8JqD+tsQeQNFCHjY2ZL9JtvBdX6K6O4J1lWzjyXOfcB8P6BHJUUdAoLe7zhPKD6V6p5c9WGjTLRVFWFPZXgA6ZksmMfzV3iJR6I5LhNKvTfeSDZEbIUWnSceqeEZM6xR3iR+4vFQjbT5ik5I/WsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAHC31azKPmIw9jnf4UyHUygo09Hsthpa2qx8+lj9os=;
 b=hO59BS7uPmpM0b3Elk8822fI5Q4DZa/9F1NGTCyHu7OLN9yhnFqK0c4rbv9cQRDkZaeYy8VRAMZoxpwmssXCqLQKVWTFHSmbHpS8ptNIFQYohpOo9d2yvhzQz/JQFTs8TQSTE1L2gWkIWa6IXHXPNPajBh/omwbtiPAKwcQAv6s=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3463.namprd12.prod.outlook.com (2603:10b6:a03:ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 01:17:01 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 01:17:01 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [RFC] ARC: initial ftrace support
Thread-Topic: [RFC] ARC: initial ftrace support
Thread-Index: AQHWBFAKT5pl4ywT2UWnQpMfdrf0t6hcrJAAgAhjoQA=
Date: Thu, 2 Apr 2020 01:17:01 +0000
Message-ID: <fe7ae84c-745a-04b4-dcc0-5df8cc35ee0c@synopsys.com>
References: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
 <20200327131020.79e68313@gandalf.local.home>
In-Reply-To: <20200327131020.79e68313@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2878:237:6628:fcbe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba92a9c6-b940-4f31-7e8b-08d7d6a38c03
x-ms-traffictypediagnostic: BYAPR12MB3463:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB346324558A06CAB4E0178555B6C60@BYAPR12MB3463.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(366004)(136003)(39860400002)(346002)(396003)(86362001)(110136005)(66946007)(31696002)(64756008)(6636002)(66556008)(66446008)(54906003)(66476007)(478600001)(316002)(76116006)(31686004)(36756003)(5660300002)(2616005)(4326008)(2906002)(81156014)(6506007)(8676002)(53546011)(81166006)(6512007)(71200400001)(186003)(8936002)(6486002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KctxenmxKtTcx50I2NW092RxMajNjH7WH6j7zSsO0i0KthTLal68eNAlu2wzrHRri/K1rXlGYMJvBzdp1BhDULaT4eRntbjnQEYTVgTlLXdmBIB/I/G/hkiIUm7PXaXKG7smAm++wCI7q//PJ4NTIeBex0T0HYbymbrdy8eY06GhYqKgb77AoK2lC7vTe0fxvLAdKJC2k7//ZFrAunUCzdckYh4GqQvAKyfOlgFs9Citn/tbe6MignymPr4lSWeJk/PocUM/EeZOM6hZjw1bd/hImPgWiSECfVwPDyVJB6CM/VVIOxCBvSSQgnNxSVr9hbH+oF7EQxQOTuseYoU5/CTXW7Jh+1vL0/xVV0BEkxRq1Uvsuyw57udsSBX0jXw0fl1vLiRmhsveE2xsPQ2Oo82KzIp2nkOy/RxK857RMjmOCTq3f+Jw63CJV5HJUjQb
x-ms-exchange-antispam-messagedata: LiSoh34cUFYposhwtpYwpznxGfhiRcaYwI7/CubB8tWDhWGuRcx9C0mSnxwKuX2+CFE5YJy6tVEahQEjIw1qZkovSS8kflwZWdtoDcbE4Tze+yG0uxTZZ3LanKul0+ynfgdQ3eg68lD08i5PLH4gJOIZXmfk/inpusRTXQ3WBmFibumYlq0PfiyPRpv29zEnXumDGAEYNs2c1actR/rJTw==
Content-ID: <449BF7F93279404B975E223888694978@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ba92a9c6-b940-4f31-7e8b-08d7d6a38c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 01:17:01.1098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HNJEL52HctWyNs8dsWCHAdKUDdr5/4tppomN2T1HWSnHSgR4sexK5riy746pB/MOybaLjZXTbD+z1SJ/OKuFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3463
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_181740_546723_1ED4D164 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Zissulescu <claziss@gmail.com>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

+CC Claudiu

On 3/27/20 10:10 AM, Steven Rostedt wrote:
> On Fri, 27 Mar 2020 18:53:55 +0300
> Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:

Maybe add a comment that gcc does the heavy lifting: I have following in glibc

+/* this is very simple as gcc does all the heavy lifting at _mcount call site
+ *  - sets up caller's blink in r0, so frompc is setup correctly
+ *  - preserve argument registers for original call */

>> +noinline void _mcount(unsigned long parent_ip)
>> +{
>> +	unsigned long ip = (unsigned long)__builtin_return_address(0);
>> +
>> +	if (unlikely(ftrace_trace_function != ftrace_stub))
>> +		ftrace_trace_function(ip - MCOUNT_INSN_SIZE, parent_ip,
>> +				      NULL, NULL);
>> +}
>> +EXPORT_SYMBOL(_mcount);
> 
> So, ARCv2 allows the _mcount code to be written in C? Nice!

Yeah, the gcc backend for -pg was overhauled recently so it is a first class "lib
call" meaning we get all the register save/restore for free as well as caller PC
(blink) as explicit argument to _mcount

void bar(int a, int b, int c) {
	printf("%d\n", a, b, c);
}

bar:
	push_s	blink
	std.a r14,[sp,-8]
	push_s	r13
	mov_s	r14,r1
	mov_s	r13,r0
	mov_s	r0,blink
	bl.d @_mcount
	mov_s	r15,r2

	mov_s	r3,r15   <-- restore args for call
	mov_s	r2,r14
	mov_s	r1,r13
	mov_s	r0,@.LC0
	ld	blink,[sp,12]
	pop_s	r13
	b.d	@printf
	ldd.ab r14,[sp,12]

@Eugeniy, this patch looks ok to me, but a word of caution. This won't work with
elf32 toolchain which some of the build systems tend to use (Alexey ?)

The above _mcount semantics is only implemented for the linux tool-chains.
elf32-gcc generates "legacy" __mcount (2 underscores, blink not provided as arg)
likely done by Claudiu to keep newlib stuff unchanged. Perhaps elf32 gcc can add a
toggle to get new _mcount.

And this is conditional to ARCv2 due to future ties into dynamic ftrace and
instruction fudging etc ? We may have to revisit that for BE anyhow given such a
customer lining up.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
