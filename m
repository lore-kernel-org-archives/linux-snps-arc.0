Return-Path: <SRS0=H4GQ=BQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010BDC433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Aug 2020 03:38:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDA12086A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Aug 2020 03:38:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z25q6PzW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VT1b7xUJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QH+hchqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEDA12086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WsHoLIGH2TZahnP4I26yWqy1pxQPg3DBmBtZkBOp0NU=; b=z25q6PzWQ7q/GDGpRQeMtuuX/
	4pe5TRjbyP4yDPp8K96FpfEPIswjwA6fP+vsRkpr/ZTHGslkscMFyI51hWLOgTTvw/iUy0jfUa355
	Z4+lN/KOgyvMPB3lVS07I0b35zu3fZkbDYw//2+nxf2wEWejBFexvOHqeHUbkT7umP7YS1FybaeAg
	Kl3Lf2O+ahdaFXoruG2Sj4niiTizaFgmygK2zKv4ks8/XuokmrCME3Gd1wytniLyYFKSuzL/E2lm1
	1fkczC0sdhGXWhlcn+kE8jMdFSRjzoypAGChibCVpR6YNk88P1CT7PQTnTF6p7Z5Gpk9981eE0V1R
	zBqqarjXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3WjA-0004mn-VD; Thu, 06 Aug 2020 03:38:01 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Wj8-0004l5-LJ
 for linux-snps-arc@lists.infradead.org; Thu, 06 Aug 2020 03:37:59 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8FE23C0BBF;
 Thu,  6 Aug 2020 03:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1596685074; bh=mTbIoGVyn52PJVVHDSc/N+6tHqRUg5Cg2cxMesWoUW8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VT1b7xUJntyPZBA0p2Be4Bb07feXrhvz1bhLhlFJU0zJWZrQZoUJPCduYabXQZQTP
 y0rj3cOLCkeO9MMxsPNt/pMux2CS00SUhWfT95VWoHVhMEBe+Ifvq9m3LxZl5w2lml
 KWvwtelQvXvd4yPOTplkGd2d56osbRKOVVv8E9RLNfcF6g1SuoC1lavEtuldb/Sm82
 5IOUi74jxFf/QSb3bFiTYb/WaWfHj1f07kF+3Uw57acPVH7QlfsxUOr7UawxXLWmzl
 ZBpvLKO5aY6EJMqGZp16+iZXqfVUSGn1ULUrMJx74//uDtHGpgPuhdDt9x4PBa47I+
 QEYwdJqAgiFiA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9697AA0071;
 Thu,  6 Aug 2020 03:37:39 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B3E4740106;
 Thu,  6 Aug 2020 03:37:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="QH+hchqt";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=libRj8mDZTzxw+lD96vk23ZPlLZHJHPrnHaBdREx6cEkLC2MqgzGdhDwEMbc+PdtoXOcT8cCFWNuXM2VAfrvOIuu1wQIL+LwxCX2QeAOnMWk0/EOum8C5pZgkY3YhiDnprT2k3AarROjKtoAqphHJws6LJYakIz2+5e8wsyqors8LUuyae1dg4LlpwpBB5xw6DqcnwpNb2VkFhNyR/dxFOoSi21ABXb0j1AQnuzgzS7kS7xhzh0g4TioZUPr4cbojOAyPkllUF157FBopmnq3D9+KfvAwMSt4wx80cZsD1RVgBfoiqT7mLHC129Ls5SMqQ8uo1oFAwX6JoCzLCT1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTbIoGVyn52PJVVHDSc/N+6tHqRUg5Cg2cxMesWoUW8=;
 b=CSwuzBbiDJMsgq2FpL/YHWkLXSSETgnLEaMy3k13uWezK19a/eo3NSjlaqGwPpuVc3hacJP15/eGqQMNwErFl1IKrX9oo1UFI+Cc6RTj+cruT6vmqHZ1UG3PF7IqcOznDUsuDTEfvcDPJ1bYgVMYV4nW+SQcPpa27Gb0PD7j0TfFcK/lEynFHTS//cQvGnz5cahDEQWPO6Nfe5LxZBw11I8wgGT7LGpcbtLY7BAMLwe1DMwYQipxuk8hq96NYApZr2B2dEZJMOg6iDzStUDB1TwyTzF+6zZO7+YOYEKpV62iwL9d4eNVHWXMYBRMqmpYlWHObRaXFbCaqzzK8+3sOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTbIoGVyn52PJVVHDSc/N+6tHqRUg5Cg2cxMesWoUW8=;
 b=QH+hchqtE4WPxlc04Ku35soWCRX9dkCBohRrhBGm4UQODIxDnt+tnibUITZ9e4XOLyrmy/J7igU5adjLsVABpBIcKo8iLqr65CX7JHRGaClneihH+8YMNWQHiyq1oGv4UkyqjYzP5nrMbKiN4qi7PCrhIfGenCqRiuYdLPQirP8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3208.namprd12.prod.outlook.com (2603:10b6:a03:13b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Thu, 6 Aug
 2020 03:37:31 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3239.023; Thu, 6 Aug 2020
 03:37:31 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Andy Shevchenko
 <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header loop
Thread-Topic: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Thread-Index: AQHWZkWxGrDkzLqp+ESl+oI9es3nTqkfv7EAgAq5kIA=
Date: Thu, 6 Aug 2020 03:37:31 +0000
Message-ID: <04d25afe-d258-86ba-b2d1-cee8b60ee227@synopsys.com>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
 <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
 <20200730005922.GA9710@gondor.apana.org.au>
 <CAHp75Vf9Oj5DsGveN32i0A2TqudS+DXfhJYUOzSMJ6VD_A+2Ow@mail.gmail.com>
 <20200730075040.GA21623@gondor.apana.org.au>
In-Reply-To: <20200730075040.GA21623@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27af3388-65a8-4386-990d-08d839ba0ce5
x-ms-traffictypediagnostic: BYAPR12MB3208:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB320802A9B0A9A5D2E3E070C4B6480@BYAPR12MB3208.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8aEBIpZ8ZsuuRYnLMy5Fttu4bEduikQgYOz+AxGYt0WRwZz3u2Rq0AshobUJuEJau6gPyhFjs6eVvy4uLgX8xgsQFasmMg4A9Up9BuTBFAEVrhE+RYHp0rmqimZTiie+EIsGPT8Az70fZKWgN0EmzBhWSHLP1yqVe0HzyR9ftiF7OUn6QgZVWs3s4HPJRqjJ4AWz0c9nOEajpVxzdRCzQzgHJLZZghTd5hfXPxop2C0sCNL9iV7qnlY7NjARSY4E2sevEM5RecrpHYlZoyxS/6g+1Z+yErIJpp39o2RfHFQkv3GXeHwinfmC1bZubvrXp6aQWouiDRGPhONu1DVhEdbSaaO4sh2ryW+UlvINg/kd8y3OwIgg7UTc6rJaGZK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(83380400001)(26005)(66476007)(66556008)(66446008)(64756008)(8936002)(66946007)(186003)(4744005)(53546011)(6506007)(6486002)(2616005)(36756003)(478600001)(4326008)(31696002)(71200400001)(8676002)(5660300002)(86362001)(31686004)(76116006)(316002)(110136005)(7416002)(54906003)(2906002)(6512007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OZLHl+iGGWNc+4HBr6q4Y+80CRFiq8nOMX3Wn7QejiP+GmV7TveRzoerze6JuQmb/z8v7mqctdjAU56VI2D2H8SSTm3YIp5JPCWGw5c+yTg+V2uUCBYNHQXd3QQfatYHd4wubNrClJD7dAS759fYpRYRXf6EbYhagp6E+Z+jFyJj2BoTAm6uBF8XmdoAP9uRjDsQwY10TdgO4psdvEbraGMQhycPTM4DWEtQc8LZiLV9HRtwVASh1r1gyQe+YmFbNrVd12JYduwln0mgFDKrQTDJ86tM5F9n4K81j/CkdRvyfA3WPWC3kbWOoDkunWouyKb8VTX4tg1m9eS6UBjEDK0I1hCKJdqxestfigKJAcKZCUo+utJtXEzaW8t3serL9LVSi74h89ugWjyuvm3hswIU7JVz40dhKX5t7Oy8fafP2VumjOy/7j1rvfcHHo+NdncNnuShbwoYrwzB/k1IwjgEi+6Syw4e8PzDxbCscgK6hvFoPULRCPjIhR0BhF61QyjvQBzzVUake/E2Ni4VOeGwkjp5Lj/vIPZ4uxdZ1pdJiixv/VkaQBzMhz/HHAmDafNDCZ51Ly7KKv4fL4yyKgWrKVqiA0ZcYc82dOa2Chge0MR8zZ4/DHdydiOP9h5tO8xXGh7+8aoWJawFUWSuXQ==
Content-ID: <CDC31A1DA336914D8DA7A55C2E028D7B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27af3388-65a8-4386-990d-08d839ba0ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 03:37:31.4819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcNNqOKg/VsLQnwiYYC3VpDf4P4f4fyf4WAvNfsvfnfl8irMThlAwi18MhAjpR9d1xGjPc5Lbv0xgC8fyjMqbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_233759_127941_95B162ED 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: Petr Mladek <pmladek@suse.com>,
 "maintainer:X86  ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Waiman Long <longman@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arcml <linux-snps-arc@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/30/20 12:50 AM, Herbert Xu wrote:
> On Thu, Jul 30, 2020 at 10:47:16AM +0300, Andy Shevchenko wrote:
>> We may ask Synopsys folks to look at this as well.
>> Vineet, any ideas if we may unify ATOMIC64_INIT() across the architectures?
> I don't think there is any technical difficulty.  The custom
> atomic64_t simply adds an alignment requirement so the initialisor
> remains the same.

Exactly so.

FWIW the alignment requirement is because ARC ABI allows 64-bit data to be 32-bit
aligned provided hardware deals fine with 4 byte aligned for the non-atomic
double-load/store LDD/STD instructions. The 64-bit alignement however is required
for atomic double load/store LLOCKD/SCONDD instructions hence the definition of
ARC atomic64_t

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
