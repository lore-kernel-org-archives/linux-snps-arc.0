Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA8AC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 15:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19C120720
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 15:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wKqKZoSV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IGug9yFz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CSEoFBiF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19C120720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/tHfsNIWayGsAlzL8W2Qn0mwFjQuGYAK5ebFTx4sYoQ=; b=wKqKZoSVktkGldvUWxHToSX5a
	K3Wa5UQ9U69QbklP9s64QMIXKacC9ur4OR8pznRNAEPnGsTC5WahN6Z6NyYLu0/llNNyHICKrAmHr
	sm3QA53x+DUrxXnsxMQcPZSNGvpNmYChqk5mFWx1RhzOaZbofXXOHs3gKDHv1pWc8VbApLnNcrDzz
	vXBPT1T0BN/+CM09eRayseSiJJjQrFKbqevPnC13lNlNxRBpaGlqh8TPREa2bP5Oo4cJ658Tn3aVp
	Zaq3Y4Rmck0xkxN+8lU9akkoeX5iSokSNivbPC+j7cupKSHkqevsxKEYBC8TpiaYASGh55d3wQmTj
	/+u4s0NfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtvLJ-00054m-8k; Fri, 10 Jul 2020 15:53:41 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtvLG-00054J-Cy
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 15:53:39 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5060FC0436;
 Fri, 10 Jul 2020 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594396416; bh=WXb3HvGqS+tcseS729lUWFjq9iqtr/B8PhtYUFIN+ro=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IGug9yFzsT9ltPINhUmFWukzg1OwsFQ+EDILBixSdY+inxKF6DbFJhYMXDy/6uHgE
 ohvsdVNjUCjI5LtjNmwdwHc1x4CoFvYWC/jNAlo52NQbvbQJ3/zotI0XIYAvkCIHL5
 lSvYul0k8WCgo+UIV8HO0ENeIOLwB/zgGDzixZohgNkk0Q41d0jnhP8Ej3+Xf8M8VH
 FX/0OjK1NFJYqxMlzAc5UU0PqhUXNqP5CHFDI8LEShF+le64uWtcBr6OzuvA/QjUZS
 85qbAgQpBR4rCf5Z9KduYifOBQLGuCW9/ECwFU4BO1B2mdD0mggPNNXNyk2pkBjDAy
 nMzDfMfsEAH3Q==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2F59BA005A;
 Fri, 10 Jul 2020 15:53:29 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2030880FAA;
 Fri, 10 Jul 2020 15:53:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CSEoFBiF";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmXmotlu+AjIVKdV3SvsSEWeijtcgcnjxiLZ18MmCwAWdTf7SrULtcvmW1X9FON+JzQg/avssshHzSa35C4KodXzGtZQunPMa/lVn9UxzgifkdZV5Rv/PFCBIMVEIHUWDdWiJsgbhl3s2UbXHziEroOKpWMoPmdYqqOeOp0MobYfCedCz9KKh7EzyBX6pn8PJ4i0V7mYEq4+uf6MalF/wbNpYOSKe0UzjCnAfhPPhss+JjBS2zeU2yMojBTs5d0hFNlhw/UbCZ5/8MkDF3xkK56NXDo2ylGTAAE4meUx8RGvw+ubf6crSvz5D6CdDHUFsPNLLlT3/8awVL6LqoWfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXb3HvGqS+tcseS729lUWFjq9iqtr/B8PhtYUFIN+ro=;
 b=hpxZAa4bq1YVwkqGlLS2EEsCsNb+xwbs4twWwV7Q7tImEPQHdu9Zztj2SdHvdioP5ryWhlWZt/2XV4c6sndroPPhccovwmzAlUAd8u0gkF4EKDK+YttwiGyGNbr1Lr/SLRoYq+KVx+AGUMeNFXPUqcr6mvuKxnW/JSAeuwAWS/1y7qdnTc6/DMZFDcFuULvDTg5Y1HZ+WWGrSWE94cas0u+BILVSCSdYgegrcJI4XNNwjKPMcpWZYCF3NHzj2ZjndA9MdH1klQrVmkSGOrlJLLJrfo4YXBxLSQDaUaWfCVpyLVVnRciPqcrYAogS3+zw+VEuoaSEs7/C8GNHVYCrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXb3HvGqS+tcseS729lUWFjq9iqtr/B8PhtYUFIN+ro=;
 b=CSEoFBiF7jdVT3XaJjZIQTkbbYrZs/ZLQ5HtO/wWHYdXGN+36Mgt/5ofgGkUxlrIcok5WJ1JG4pxYQjtBSTlyRob4A44h4h5/dwxZxYnR5zV3gvqwRZOnVXmNxdMgF+/2wxfnm6Ugn7zad2aTd25e+OJN8vszkkpRgnIXkx/nEw=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 10 Jul
 2020 15:53:25 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 15:53:25 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>, Alistair Francis via Libc-alpha
 <libc-alpha@sourceware.org>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Topic: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
Thread-Index: AQHWVjjy32kEybdCoEKZf9ozCP0tuKj/zGwAgADASIuAAGtWAA==
Date: Fri, 10 Jul 2020 15:53:25 +0000
Message-ID: <cf8e41c7-8a58-f9bc-ab6a-ca5099bf6b46@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
 <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
 <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
 <87o8on4t38.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87o8on4t38.fsf@oldenburg2.str.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 646a8ac3-6ab6-4c7c-5b6a-08d824e96158
x-ms-traffictypediagnostic: BY5PR12MB4258:
x-microsoft-antispam-prvs: <BY5PR12MB4258969B4CFFCA1878C0FB54B6650@BY5PR12MB4258.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 04gmZytSwOFVVA1E4TJzFxNJWmKLYGD1gVptR14M2IT/acUfiZ8ukblTus7HP7ENmhZE4PEPF4cYJCGbK19WLOqfOj9KaX/+DZThVu9YnKObIaVmq2vt1MOKa4VdmPNwNdJt0KanQ7NBpwQCKs6okq9y9A3oBK4BsmVq4dQKG8mzxfSVwUrDZ2dv6NPLg7UUT4ZfxkO9phE6t71szO/OEhJgHxXMK+SIcKDmnnrLuMxU7Ng/qWeKoBUzydpviHmX1GC2X6otkX5zqaysHQyGPLP97gqumUUNMk1XLoEvwVwJwzgu30nuToQccKrrjnVSis18y1bc6uiG81CbrVKeOabWbaQtM56GGW1XPkTlhpssQwMTSH9WiOWHC3YsZej1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(396003)(376002)(39860400002)(366004)(478600001)(6512007)(316002)(86362001)(110136005)(2616005)(71200400001)(66556008)(66946007)(31686004)(66446008)(64756008)(76116006)(66476007)(186003)(83380400001)(54906003)(8936002)(4326008)(36756003)(5660300002)(8676002)(53546011)(6506007)(31696002)(2906002)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KhUGtx15UkidZ7Rb3lx1aL00vNT6gSzLdbtxi51VdhtrhGS5VJhxv4e6wZrz1YZMyquJ8g/V+LMaF4AbBdS1Vo6Xixtye+CbQmXLDp+vPLkfw1+p6JKh3IfcMfBaFuB9rOvw0avMwn5MBIWwK5/EeoJxiSWHK7Rauphx/eIRO3pKtzl3g+HcGs2yR3FK/Z8PqZSk/EfXkxEDdbeTrbDM/4hMT6STILlJ7P8vwN6/FLE0tQNGrOOrCFjkn/fHliV54KU6/OsKLFWtzKpVAOoWjCjSvhoGp4aY5N4O0hwiMpkQYh2A9uTfZxAb8B/RYinuP/N/+c4o6f3D9tLzHDGZODQOwOOnyPT0XMudt2e5kB1H99K7T8jhKnlaLjItmqIfWe/G2Ge3hJKFHIOvKzXerrjSLL/JgaBLuiJ+6hccxxbPArXGHqTg693YTI00vpJPEp5ASvBbijBFfQDPBal6DXFNzbSAFil2VxXnhfsQ31A4MFieAzsljF///+rpEnByR7WQ1+GqNrb+FNpS13CjTAk0hO8GUtJC2dhJ5sC1lN2S7UKO5rG8EQLdSo2bduHF
x-ms-exchange-transport-forked: True
Content-ID: <60032FEEBD35DD49966FFE8C85965BD1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646a8ac3-6ab6-4c7c-5b6a-08d824e96158
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 15:53:25.1166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOC/IANeSX8GiNbWuE8fwCCBEUGBKW9CgtXmzcbcrK4/mGh7sXo+0WDk5eMBBT1Z145DH3tT/KUKn6b0HAwDng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_115338_865665_A9E8FDED 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/10/20 2:28 AM, Florian Weimer via Libc-alpha wrote:
> * Alistair Francis via Libc-alpha:
> 
>> On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
>> <libc-alpha@sourceware.org> wrote:
>>>
>>> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
>>>>> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
>>>>> abilist updates). Will do a full testsuite run
>>>>
>>>> No regressions in sysvipc tests !
>>>
>>> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
>>> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
>>> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
>>> shmctl)"
>>>
>>> FAIL: dlfcn/tststatic
>>> FAIL: dlfcn/tststatic2
>>> FAIL: dlfcn/tststatic3
>>> FAIL: dlfcn/tststatic4
>>> FAIL: dlfcn/tststatic5
>>> FAIL: elf/tst-libc_dlvsym
>>> FAIL: elf/tst-libc_dlvsym-static
>>> FAIL: elf/tst-single_threaded-static-dlopen
>>> FAIL: elf/tst-tls9-static
>>
>> I see the same recent-ish regressions for RV32.
> 
> Did you rebuild from scratch?  After the libc.so/ld.so ABI changes that
> went in recently, it could be the result of incomplete make
> dependencies.

From scratch meaning glibc alone or the whole toolchain. I used buildroot and
glibc-dirclean to nuke entire glibc but gcc was not rebuilt. I can try that too.

Some of the failed tests have prints about static TLS block ... so I'm wondering
if they could be related ?

| $ cat dlfcn/tststatic.out
| .../build/libc.so.6: cannot allocate memory in static TLS block

Also while we figure this out, does this prevent ARC port from being committed. It
is a functioning system otherwise: I'm doing doing cross run of testsuite with
sshd etc involved and these addition 10+ failures don't seem to be getting in the way.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
